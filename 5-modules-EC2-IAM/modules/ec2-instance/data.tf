# Data source to get the most recent Amazon Linux AMI ID in the eu-west-3 region
data "aws_ami" "amazon_linux_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]  // Rest of the name (processor architecture (x86_64, ...), root device type (ebs, ...)) is not mentioned
  }
}
