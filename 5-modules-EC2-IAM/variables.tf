# This file contains the variables for the EC2 instance, SNS topic, and Lambda function

# Variables for the EC2 instance

variable "region" {
  description = "region for the AWS EC2 instance"
  type    = string
  default = "us-east-1"
}


variable "ec2_instances" {
  description = "List of EC2 instances to deploy"
  type        = map(object({
    instance_name = string
    instance_type = string
    user_data     = string
  }))
}

variable "instance_role_name" {
  description = "Name of the IAM role for the EC2 instance"
  type        = string
  default     = "LabInstanceProfile"  // LabRole role's instance profile
}


# SNS and Lambda variables

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


# CloudWatch variables

variable "cloudwatch_rule_name" {
  description = "Name of the CloudWatch event rule"
  type        = string
}
