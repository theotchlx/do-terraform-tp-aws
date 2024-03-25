# This file contains the variables for the EC2 instance, SNS topic, and Lambda function

# Variables for the EC2 instance

region = "us-east-1"

instance_name = "my-ec2-instance"

instance_type = "t3.nano"
instance_role_name = "LabInstanceProfile"


# SNS and Lambda variables

sns_topic_name = "my-sns"

lambda_function_name = "my-lambda"

email_subscriptions = ["your email address here"]

notification_message = "hi!"

lambda_role_arn = "example arn"