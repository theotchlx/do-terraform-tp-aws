# This file contains the values for the variables for the EC2 instance, SNS topic, Lambda function and CloudWatch rule.

# Variables for the EC2 instances

region = "us-east-1"
instance_role_name = "LabInstanceProfile"

ec2_instances = {  # Map of instances
  "instance1" = {
    instance_name = "my-first-ec2-instance"
    instance_type = "t3.nano"
    user_data     = "#!/bin/bash\necho 'hello'"
  }
  "instance2" = {
    instance_name = "my-other-ec2-instance"
    instance_type = "t3.nano"
    user_data     = "#!/bin/bash\necho 'something else i guess'"
  }
}


# SNS and Lambda variables

sns_topic_name = "my-sns"

lambda_function_name = "my-lambda"

email_subscriptions = ["Your email(s)"]  # List of emails

notification_message = "hi!"

lambda_role_arn = "Your role ARN"  # Use the LambdaRole ARN. It's the role that will allow the Lambda function to publish to the SNS topic.

# CloudWatch variables
cloudwatch_rule_name = "my-cloudwatch-rule"
