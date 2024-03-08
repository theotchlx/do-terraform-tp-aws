terraform {
  required_providers {
    # Define the AWS provider
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"  # Paris region (could also be exported as environment variable AWS_DEFAULT_REGION)
}

module "ec2-instance" {
  source = "./modules/ec2-instance"

  // Pass the input variables to the module
  instance_name      = var.instance_name
  instance_type      = var.instance_type
  instance_role_name = var.instance_role_name
}
/*
module "module2" {
  source      = "./module2"
  example_var = "value_for_module2"
}*/
