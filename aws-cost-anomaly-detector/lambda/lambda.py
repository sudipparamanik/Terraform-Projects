import os
from datetime import date, timedelta

import boto3

ce = boto3.client("ce", region_name="us-east-1")
sns = boto3.client("sns")

TOPIC_ARN = os.environ["SNS_TOPIC_ARN"]
MULTIPLIER = float(os.environ.get("THRESHOLD_MULTIPLIER", "1.5"))
MIN_COST = float(os.environ.get("MIN_DAILY_COST", "1.0"))


def get_daily_costs(days=8):
    end = date.today()
    start = end - timedelta(days=days)
    response = ce.get_cost_and_usage(
        TimePeriod={"Start": start.isoformat(), "End": end.isoformat()},
        Granularity="DAILY",
        Metrics=["UnblendedCost"],
    )
    return [
        float(day["Total"]["UnblendedCost"]["Amount"])
        for day in response["ResultsByTime"]
    ]


def lambda_handler(event, context):
    costs = get_daily_costs()

    if len(costs) < 2:
        print("Not enough cost data yet")
        return {"status": "no_data"}

    yesterday = costs[-1]
    previous = costs[:-1]
    average = sum(previous) / len(previous)

    print(f"Yesterday: ${yesterday:.2f}, average: ${average:.2f}")

    if yesterday > average * MULTIPLIER and yesterday >= MIN_COST:
        message = (
            f"Yesterday's AWS cost was ${yesterday:.2f}.\n"
            f"The average over the previous {len(previous)} days was ${average:.2f}.\n"
            f"Alert threshold: {MULTIPLIER}x the average."
        )
        sns.publish(
            TopicArn=TOPIC_ARN,
            Subject="AWS cost anomaly detected",
            Message=message,
        )
        return {"status": "alert_sent"}

    return {"status": "normal"}
