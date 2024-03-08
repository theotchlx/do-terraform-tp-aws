# Define the module
module "ec2_instance" {
  source = "./ec2-module"

  # Input variables
  ami_id = data.aws_ami.amazon_linux.id
}

# Data source to get the latest Amazon Linux AMI ID of the 
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  region      = "eu-west-3"

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]  // Rest of the name (processor architecture (), root device type) is not mentioned
  }
}

# Data source to get the most recent Amazon Linux AMI ID in the eu-west-3 region
data "aws_ami" "amazon_linux_eu_west_3" {
  most_recent = true
  owners      = ["amazon"]
  region      = "eu-west-3"

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

# Output the instance ID
output "instance_id" {
  value = module.ec2_instance.instance_id
}