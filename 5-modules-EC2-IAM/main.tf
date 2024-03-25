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

  // Pass the input variables to the module
  ec2_instances = var.ec2_instances
  instance_role_name = var.instance_role_name
}

module "sns-service" {
  source      = "./modules/sns-topic"
  
  // Pass the input variables to the module
  sns_topic_name        = var.sns_topic_name
  lambda_function_name  = var.lambda_function_name
  email_subscriptions   = var.email_subscriptions
  notification_message  = var.notification_message
  lambda_role_arn       = var.lambda_role_arn
}
