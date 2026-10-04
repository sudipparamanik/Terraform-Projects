resource "aws_sns_topic" "cost_alerts" {
    name = "cost-anomaly-alerts"
  
}
resource "aws_sns_topic_subscription" "email" {
    topic_arn = aws_sns_topic.cost_alerts.arn
    protocol = "email"
    endpoint = var.alert_email
  
}
