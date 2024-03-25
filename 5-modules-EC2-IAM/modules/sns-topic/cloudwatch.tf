resource "aws_cloudwatch_event_rule" "sns_event_rule" {
  name        = "sns_event_rule"
  description = "Event rule for triggering Lambda function from SNS topic"
  event_pattern = <<PATTERN
{
  "source": ["aws.sns"],
  "detail-type": ["SNS Subscription Confirmation", "Notification"]
}
PATTERN
}

resource "aws_cloudwatch_event_target" "sns_event_target" {
  rule      = aws_cloudwatch_event_rule.sns_event_rule.name
  target_id = aws_lambda_function.lambda_function.function_name
  arn       = aws_lambda_function.lambda_function.arn
}