# Provision the SNS topic and its subscriptions

resource "aws_sns_topic" "sns_topic" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "sns_subscription" {
  for_each = toset(var.email_subscriptions)  // Email subscriptions are passed as a list of email addresses

  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = each.value  // Endpoint is the email address
}