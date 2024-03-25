# This file contains the variables for the EC2 instance, SNS topic, and Lambda function

# Variables for the EC2 instance

region = "us-east-1"
instance_role_name = "LabInstanceProfile"

ec2_instances = {
  "instance1" = {
    instance_name = "my-first-ec2-instance"
    instance_type = "t3.nano"
    user_data     = "something"
  }
  "instance2" = {
    instance_name = "my-other-ec2-instance"
    instance_type = "t3.nano"
    user_data     = "something else"
  }
}


# SNS and Lambda variables

sns_topic_name = "my-sns"

lambda_function_name = "my-lambda"

email_subscriptions = ["your email here"]

notification_message = "hi!"

lambda_role_arn = "example ARN"