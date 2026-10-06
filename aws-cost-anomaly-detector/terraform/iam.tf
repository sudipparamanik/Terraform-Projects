data "aws_iam_policy_document" "lambda_assume" {
  statement {
    actions = [ "sts:AssumeRole" ]

    principals {
      type = "Service"
      identifiers = [ "lambda.amazonaws.com" ]
    }
  }
}

resource "aws_iam_role" "lambda" {
    name = "cost-anomaly-detector-role"
    assume_role_policy = data.aws_iam_policy_document.lambda_assume.json
  
}
data "aws_iam_policy_document" "lambda_permissions" {
  statement {
    actions = [ "ce:GetCostAndUsage" ]
    resources = ["*"]
  }
  statement {
    actions = [ "sns:Publish" ]
    resources = [ aws_sns_topic.cost_alerts.arn ]
  }
}
resource "aws_iam_policy" "lambda_permissions" {
  name   = "cost-anomaly-detector-policy"
  policy = data.aws_iam_policy_document.lambda_permissions.json
}
resource "aws_iam_role_policy_attachment" "custom" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.lambda_permissions.arn
}
resource "aws_iam_role_policy_attachment" "logs"{
    role       = aws_iam_role.lambda.name

    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

