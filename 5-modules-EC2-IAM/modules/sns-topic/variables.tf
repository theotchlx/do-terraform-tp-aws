variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "email_subscriptions" {
  description = "List of email addresses to subscribe to the SNS topic"
  type        = list(string)
}

variable "notification_message" {
  description = "Notification message to send to subscribed emails"
  type        = string
}

variable "lambda_role_arn" {
  description = "ARN of the Lambda function's IAM role"
  type        = string
}