variable "aws_region" {
  type    = string
  default = "eu-north-1"
}
variable "alert_email" {
  type        = string
  description = "Email that receives cost alearts"
}

