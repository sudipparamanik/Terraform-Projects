variable "aws_region" {
  type    = string
  default = "eu-north-1"
}
variable "alert_email" {
  type        = string
  description = "Email that receives cost alearts"
}

variable "threshold_multiplier" {
  type        = number
  default     = 1.5
  description = "Alert if yesterday's cost is above average times this value"
}

variable "min_daily_cost" {
  type        = number
  default     = 1.0
  description = "Ignore anomalies below this daily cost in USD"
}

variable "schedule_expression" {
  type        = string
  default     = "cron(30 3 * * ? *)"
  description = "Daily at 03:30 UTC, which is 9:00 AM IST"
}

