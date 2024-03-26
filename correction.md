Des modules très clairs, un code lisible est compréhensible au premier coup d'oeil, les variables sont bien organisées, bravo

Cloudwatch est directement compatible avec SNS, pas besoin de repasser par la lambda pour envoyer l'alerte. Ta solution reste viable
Pour déployer plusieurs EC2, il te suffisait de faire ta boucle sur l'appel du module en lui même dans ton fichier main principal
L'id des EC2 ne sont pas envoyé dans l'email. Tu peux utiliser les locals pour formatter correctement le message passé en var.

Note : 16 / 20