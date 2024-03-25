# Provision the EC2 instance
resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.amazon_linux_ami.id
  instance_type = var.instance_type
  // user_data     = var.user_data

  iam_instance_profile = var.instance_role_name

  tags = {
    Name = var.instance_name
  }
}
