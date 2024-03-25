// Module outputs

# ec2-instance module outputs
output "ec2_instance_ids" {
  description = "The IDs of the deployed EC2 instances"
  value = module.ec2-instance.instance_ids
}

# sns-topic module outputs
# These are used to define the Cloudwatch event target in the cloudwatch-prevention module
output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = module.sns-topic.lambda_function_name
}

output "lambda_function_arn" {
  description = "The ARN (Amazon Resource Name) of the Lambda function"
  value       = module.sns-topic.lambda_function_arn
}
