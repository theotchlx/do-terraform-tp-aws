resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_function_name
  role          = var.lambda_role_arn
}

resource "aws_lambda_permission" "sns_permission" {
  statement_id  = "AllowSNSInvocation"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.sns_topic.arn
}