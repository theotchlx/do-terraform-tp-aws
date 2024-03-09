resource "aws_sns_topic" "sns_topic" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "sns_subscription" {
  for_each = toset(var.email_subscriptions)  // Email subscriptions are passed as a list of email addresses

  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = each.value  // Endpoint is the email address
}

resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_function_name
  role          = var.lambda_role_arn
  # Other Lambda function configuration...
}

resource "aws_lambda_permission" "sns_permission" {
  statement_id  = "AllowSNSInvocation"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.sns_topic.arn
}

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