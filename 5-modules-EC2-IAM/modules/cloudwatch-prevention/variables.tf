variable "cloudwatch_rule_name" {
  description = "Name of the Cloudwatch event rule"
  type        = string
}

// sns-topic module outputs passed as input variables to this module.
variable "lambda_function_name" {}
variable "lambda_function_arn" {}