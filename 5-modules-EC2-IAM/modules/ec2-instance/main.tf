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

/* The following doesn't work since the SNS topic subscription is not a resource in the module
  I would need to use remote states to make it work
  But it's a bad practice to link modules togethers, because the point of modules is modularity

  depends_on = [module.sns-topic.aws_sns_topic_subscription.sns_subscription]
  // Dependance chain: the SNS topic subscriptions must be provisioned before the EC2 instances!
*/
}
