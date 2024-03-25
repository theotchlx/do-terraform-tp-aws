# Provision the EC2 instance
resource "aws_instance" "ec2_instance" {
  for_each = { for idx, name in var.instance_name : idx => name }

  ami             = data.aws_ami.amazon_linux_ami.id
  instance_type   = var.instance_type[each.key]
  iam_instance_profile = var.instance_role_name[each.key]

  tags = {
    Name = each.value
  }
}
