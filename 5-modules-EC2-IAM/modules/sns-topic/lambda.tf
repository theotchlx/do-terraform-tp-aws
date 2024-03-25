resource "null_resource" "lambda_exporter" {
  // Use a null_resource to trigger the Lambda function when the code changes
  triggers = {
    index = "${base64sha256(file("${path.module}/lambda_function.py"))}"
  }
}

data "archive_file" "lambda_exporter" {
  // Archive the Lambda function code automatically
  output_path = "${path.module}/lambda_function.zip"
  source {
    content  = "1"
    filename = "lambda_function.py"
  }
  type        = "zip"
}

resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_function_name
  role          = var.lambda_role_arn
  filename      = "${path.module}/lambda_function.zip"
  handler       = "lambda_function.handler"
  runtime       = "python3.10"

  environment {
    variables = {
      SNS_TOPIC_ARN = aws_sns_topic.sns_topic.arn
      INSTANCE_ID   = var.ec2_instance_id
      MESSAGE       = var.notification_message
    }
  }
}

resource "aws_lambda_permission" "sns_permission" {  // Permissions granted to invoke lambda function from SNS
  statement_id  = "AllowSNSInvocation"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.sns_topic.arn
}