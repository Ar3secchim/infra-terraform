import boto3

sqs = boto3.client('sqs', region_name='us-east-1') 

# Cria a fila SQS
response = sqs.create_queue(
    QueueName='Ada_Fila',
    Attributes={
        'DelaySeconds': '5'  # Atraso opcional para as mensagens
    }
)

# Obtém a URL da fila criada
queue_url = response['QueueUrl']
print("Fila criada com sucesso. URL da Fila:", queue_url)


# Envia uma mensagem para a fila
queue_url = 'URL_FILA'

sqs = boto3.client('sqs', region_name='us-east-1')

response = sqs.send_message(
    QueueUrl=queue_url,
    MessageBody='Aluna xxx entregou o projeto'
)

# Exibe o ID da mensagem enviada
print("Mensagem enviada com sucesso. ID da mensagem:", response['MessageId'])

sqs = boto3.client('sqs', region_name='us-east-1')

sqs.delete_queue(QueueUrl=queue_url)
print("Fila excluída com sucesso.")


# Recebe e exclui uma mensagem da fila
sqs = boto3.client('sqs', region_name='us-east-1')

response = sqs.receive_message(
    QueueUrl=queue_url,
    MaxNumberOfMessages=1,  # Número máximo de mensagens a serem recebidas
    WaitTimeSeconds=10  # Tempo de espera  
)

# Verifica se há mensagens e exibe a primeira
if 'Messages' in response:
    message = response['Messages'][0]
    print("Mensagem recebida:", message['Body'])

    
    sqs.delete_message(
        QueueUrl=queue_url,
        ReceiptHandle=message['ReceiptHandle']
    )
    print("Mensagem processada e excluída.")
else:
    print("Nenhuma mensagem encontrada na fila.")
    resource "aws_sqs_queue" "ada_fila" {
      name                      = "Ada_Fila"
      delay_seconds             = 5
      message_retention_seconds = 86400
    }

    output "queue_url" {
      value = aws_sqs_queue.ada_fila.id
    }