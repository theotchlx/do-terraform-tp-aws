terraform {
  required_providers {
    // Define the AWS provider
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

// Configure the AWS provider
provider "aws" {
  region = "us-east-1"  // Paris region (could also be exported as environment variable AWS_DEFAULT_REGION)
}

module "ec2-instance" {
  source = "./modules/ec2-instance"

  // Passing the input variables to the module
  ec2_instances = var.ec2_instances
  instance_role_name = var.instance_role_name
}

module "sns-topic" {
  source      = "./modules/sns-topic"
  
  sns_topic_name        = var.sns_topic_name
  lambda_function_name  = var.lambda_function_name
  email_subscriptions   = var.email_subscriptions
  notification_message  = var.notification_message
  lambda_role_arn       = var.lambda_role_arn

  // Pass the ID of the EC2 instance that triggered the Cloudwatch event to the SNS topic module
  ec2_instance_id = module.cloudwatch-prevention.ec2_instance_id
}

module "cloudwatch-prevention" {
  source = "./modules/cloudwatch-prevention"

  cloudwatch_rule_name = var.cloudwatch_rule_name

  // sns-topic module outputs passed as input variables to this module.
  lambda_function_name = module.sns-topic.lambda_function_name
  lambda_function_arn  = module.sns-topic.lambda_function_arn
}