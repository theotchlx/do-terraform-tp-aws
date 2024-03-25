import boto3
import os

client = boto3.client('sns')

def lambda_handler(event, context):
    # Retrieving the environment variables
    sns_topic_arn = os.environ.get("SNS_TOPIC_ARN")
    instance_id = os.environ.get("INSTANCE_ID")
    msg_var = os.environ.get("MESSAGE")

    message = "A new EC2 instance of ID {} has been created!".format(instance_id)  # You can modify this message if you want

    # Sending the message to the SNS topic
    response = client.publish(
        TopicArn=sns_topic_arn,
        Message=msg_var + message
    )
    print(f"Message published to SNS. MessageId: {response['MessageId']}")

    return response
