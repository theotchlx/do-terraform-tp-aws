# Provision the EC2 instances

resource "aws_instance" "ec2_instance" {
  for_each = var.ec2_instances

  ami           = data.aws_ami.amazon_linux_ami.id
  instance_type = each.value.instance_type
  user_data     = each.value.user_data

  iam_instance_profile = var.instance_role_name
  tags = {
    Name = each.value.instance_name
  }
}
