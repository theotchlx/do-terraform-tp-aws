## Terraform Module: SNS Topic

This Terraform module deploys an AWS SNS topic (email) and a Lambda function that pushes messages to the SNS queue.  

When the Lambda function is triggered, an email is sent to the addresses in the subscription list.  

## Variables:

Set or modify the following variables as you require: (you can set them in a .tfvars file)  


**sns_topic_name** : the name of the SNS topic  

**lambda_function_name** : the name of the Lambda function  

**email_subscriptions** : the list of email addresses to subscribe to the SNS topic  

**notification_message** : the notification message to send to subscribed emails  

**lambda_role_arn** : the ARN of the Lambda function's IAM role  


	
