import boto3
import json

def lambda_handler(event, context):
    # Création du client SNS
    sns_client = boto3.client('sns')

    # Récupération du message à envoyer depuis l'événement
    message = "Hello, world!"  # Vous pouvez personnaliser ce message

    # Récupération de l'ARN de la file SNS à partir de l'événement
    sns_topic_arn = 'votre_arn_sns_topic'  # Remplacez cette valeur par l'ARN de votre file SNS

    # Envoi du message à la file SNS
    response = sns_client.publish(
        TopicArn=sns_topic_arn,
        Message=message
    )

    # Imprimer la réponse pour le suivi (peut être omis dans la production)
    print(f"Message published to SNS. MessageId: {response['MessageId']}")

    return {
        'statusCode': 200,
        'body': json.dumps('Message envoyé avec succès à la file SNS!')
    }
