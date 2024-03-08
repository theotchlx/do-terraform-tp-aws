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
  region = "eu-west-3"  # Paris region (could also be exported as environment variable AWS_DEFAULT_REGION)
}

module "ec2-module" {
  source = "./ec2-module"
}
/*
module "module2" {
  source      = "./module2"
  example_var = "value_for_module2"
}*/
