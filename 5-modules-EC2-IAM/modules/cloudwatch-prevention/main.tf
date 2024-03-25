resource "aws_cloudwatch_event_rule" "sns_event_rule" {
  name        = var.cloudwatch_rule_name
  description = "Event rule for triggering Lambda function from SNS topic"
  // Event pattern to match SNS events (criteria, in JSON, for matching events)
  event_pattern = jsonencode({
    source      = ["aws.ec2"],
    detail-type = ["EC2 Instance State-change Notification"],
    detail      = {
      state = ["pending"]  // Trigger lambda when a new instance is created
    }
  })
}

resource "aws_cloudwatch_event_target" "sns_event_target" {  // Target for the CloudWatch event rule
  rule      = aws_cloudwatch_event_rule.sns_event_rule.name
  target_id = var.lambda_function_name
  arn       = var.lambda_function_arn
}