data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/../lambda/lambda.py"
  output_path = "${path.module}/../lambda/handler.zip"
}
resource "aws_lambda_function" "cost_checker" {
  function_name    = "cost-anomaly-detector"
  role             = aws_iam_role.lambda.arn
  handler          = "lambda.lambda_handler"
  runtime          = "python3.12"
  timeout          = 30
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = {
      SNS_TOPIC_ARN        = aws_sns_topic.cost_alerts.arn
      THRESHOLD_MULTIPLIER = tostring(var.threshold_multiplier)
      MIN_DAILY_COST       = tostring(var.min_daily_cost)
    }
  }
}
