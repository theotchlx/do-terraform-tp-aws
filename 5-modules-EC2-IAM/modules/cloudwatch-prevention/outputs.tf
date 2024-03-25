output "ec2_instance_id" {
  description = "The ID of the EC2 instance associated with the CloudWatch event rule."
  value = aws_cloudwatch_event_rule.sns_event_rule.event_pattern
}
