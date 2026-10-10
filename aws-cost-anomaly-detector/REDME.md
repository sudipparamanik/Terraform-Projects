# AWS Cost Anomaly Detector using Terraform

An automated AWS cost monitoring solution built with Terraform, AWS Lambda, Amazon EventBridge, AWS Cost Explorer, and Amazon SNS. The project analyzes daily AWS spending and sends email alerts when costs exceed a configurable threshold.

## Overview

Unexpected cloud spending can increase your AWS bill. This project automates basic cost monitoring by comparing yesterday's AWS costs with the average of the previous seven days.

If yesterday's cost exceeds the configured threshold, the Lambda function publishes an alert through Amazon SNS. Otherwise, the result is recorded in Amazon CloudWatch Logs.

## Architecture

```text
                 Amazon EventBridge
                  (Daily Schedule)
                         |
                         v
                  AWS Lambda
                 (Python 3.12)
                         |
                         v
                  AWS Cost Explorer
                  (Daily Cost Data)
                         |
                         v
                  Cost Comparison
               Yesterday vs. 7-Day Average
                         |
                  +------+------+
                  |             |
               Anomaly       Normal
                  |             |
                  v             v
              Amazon SNS    CloudWatch Logs
                  |
                  v
              Email Alert
```

## Key Features

- Infrastructure as Code using Terraform.
- Automated daily execution with Amazon EventBridge.
- AWS cost retrieval using Cost Explorer.
- Configurable anomaly threshold multiplier.
- Optional minimum daily cost requirement for alerts.
- Email notifications using Amazon SNS.
- Execution logs using Amazon CloudWatch.
- IAM permissions for controlled access to AWS services.

## Technology Stack

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure provisioning |
| AWS Lambda | Serverless Python execution |
| Python 3.12 | Cost analysis logic |
| Amazon EventBridge | Daily scheduling |
| AWS Cost Explorer | Cost and usage data |
| Amazon SNS | Email notifications |
| Amazon CloudWatch | Execution logs |
| AWS IAM | Permissions and access control |
| Git and GitHub | Version control and project hosting |

## Project Structure

```text
aws-cost-anomaly-detector/
├── lambda/
│   └── lambda.py
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── iam.tf
│   ├── lambda.tf
│   ├── eventbridge.tf
│   ├── sns.tf
│   └── outputs.tf
└── README.md
```

*Adjust the file list to match your actual repository.*

## How Cost Detection Works

1. EventBridge triggers the Lambda function daily.
2. Lambda requests daily cost data from AWS Cost Explorer.
3. The function calculates the average cost over the previous seven days.
4. Yesterday's cost is compared against the configured threshold.
5. If the alert conditions are met, SNS publishes an email notification.
6. Execution details are recorded in CloudWatch Logs.

### Example

Assume the previous seven-day average is $10 and the threshold multiplier is `1.5`.

- Average daily cost: $10
- Alert threshold: $15
- Yesterday's cost: $20
- Result: Potential cost anomaly; send an alert if the minimum-cost condition is also satisfied.

This is a simple threshold-based detector, not a replacement for AWS's native Cost Anomaly Detection service.

## Prerequisites

Before deploying, install and configure:

- An AWS account.
- AWS CLI with configured credentials.
- Terraform.
- An email address for SNS notifications.
- Appropriate IAM permissions to provision the required resources.

## Deployment

### 1. Clone the repository

```bash
git clone https://github.com/sudipparamanik/Terraform-Projects.git
cd Terraform-Projects/aws-cost-anomaly-detector
```

### 2. Configure AWS credentials

```bash
aws configure
aws sts get-caller-identity
```

Use credentials with the necessary permissions. Never commit credentials to GitHub.

### 3. Configure Terraform variables

Set your notification email address and review the variables defined in `variables.tf`. Configure the schedule, threshold multiplier, and minimum alert cost according to your needs.

### 4. Initialize Terraform

```bash
cd terraform
terraform init
```

### 5. Validate the configuration

```bash
terraform fmt
terraform validate
terraform plan
```

Review the planned changes before proceeding.

### 6. Deploy the infrastructure

```bash
terraform apply
```

Review the plan and confirm the deployment when you're ready.

### 7. Confirm the SNS subscription

Open the confirmation email sent by Amazon SNS and confirm the subscription before expecting email alerts.

### 8. Test the Lambda function

Use the AWS Lambda console to invoke the function with an empty JSON test event:

```json
{}
```

Review the execution result and CloudWatch Logs.

## Security and Cost Considerations

- Do not commit AWS access keys, secrets, or sensitive Terraform state files.
- Apply least-privilege IAM permissions wherever possible.
- AWS Cost Explorer API usage may incur charges; review current AWS pricing before deployment.
- Lambda, SNS, CloudWatch, and related services may also incur charges depending on usage.
- Cost Explorer data can be delayed, so alerts may not reflect the latest activity immediately.
- Review AWS Budgets and billing alerts to monitor overall spending.

## Cleanup

When you no longer need the deployed infrastructure, run this command from the Terraform directory:

```bash
terraform destroy
```

Review the resources scheduled for deletion before confirming. Back up any state or data you need first.

## Learning Outcomes

Through this project, I practiced:

- Provisioning AWS resources using Terraform.
- Configuring IAM roles and policies.
- Deploying Python functions on AWS Lambda.
- Scheduling serverless workloads with EventBridge.
- Retrieving AWS cost data programmatically.
- Sending notifications with Amazon SNS.
- Troubleshooting deployments and reviewing CloudWatch Logs.

## Future Improvements

- Integrate AWS Budgets for additional spending controls.
- Add CloudWatch alarms and a monitoring dashboard.
- Improve anomaly detection with historical cost patterns.
- Add automated tests for the Python cost-analysis logic.
- Introduce a CI/CD pipeline for Terraform validation and deployment.

## Author

**Sudip Paramanik**

B.Tech Computer Science and Engineering Student | Aspiring AWS Cloud Engineer

- GitHub: [sudipparamanik](https://github.com/sudipparamanik)
- LinkedIn: [Sudip Paramanik](https://www.linkedin.com/in/sudip-paramanik-1985b0420/)

---

*Built as a hands-on project to learn AWS serverless services, cloud cost monitoring, and Infrastructure as Code with Terraform.*