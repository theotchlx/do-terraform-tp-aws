## Terraform Module: Cloudwatch prevention notification

This Terraform module deploys an AWS Cloudwatch rule and target, triggering the Lambda function provided in the `sns-topic` module whenever an ec2 instance is created. 

When the Lambda function is triggered, an email is sent to the addresses in the subscription list.  

## Variables:

Set or modify the following variables as you require: (you can set them in a .tfvars file)  


**cloudwatch_rule_name** : the name of the Cloudwatch event rule