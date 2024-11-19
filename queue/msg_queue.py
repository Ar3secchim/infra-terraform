# Envia uma mensagem para a fila
queue_url = 'URL_FILA'

sqs = boto3.client('sqs', region_name='us-east-1')

response = sqs.send_message(
    QueueUrl=queue_url,
    MessageBody='Aluna xxx entregou o projeto'
)

# Exibe o ID da mensagem enviada
print("Mensagem enviada com sucesso. ID da mensagem:", response['MessageId'])
