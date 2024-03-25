output "ec2_instance_id" {
  description = "The ID of the EC2 instance associated with the CloudWatch event rule."
  value = "See Cloud Console" #aws_cloudwatch_event_rule.sns_event_rule.event_pattern  // This is actually the event pattern, not the instance ID
  // But I was not able to find how to output the instance ID of the EC2 that triggered the event
}
