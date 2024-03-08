# Data source to get the most recent Amazon Linux AMI ID in the eu-west-3 region
data "aws_ami" "amazon_linux_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]  // Rest of the name (processor architecture (x86_64, ...), root device type (ebs, ...)) is not mentioned
  }
}

# Create the EC2 instance
resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.amazon_linux_ami.id
  instance_type = var.instance_type
  // user_data     = var.user_data

  iam_instance_profile = var.instance_role_name

  tags = {
    Name = var.instance_name
  }
}

# Output the instance ID
output "instance_id" {
  value = aws_instance.ec2_instance.id
}