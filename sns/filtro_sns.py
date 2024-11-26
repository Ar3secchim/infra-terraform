import boto3
import json

client = boto3.client('sns')

response = client.create_topic(
    Name='topic_test_boto'
)

# assinatura sms
subscription_Sms = client.subscribe(
  TopicArn=response['TopicArn'],
  Protocol='email',  
  Endpoint='renarasecchim@gmail.com',  
  ReturnSubscriptionArn=True
)

sms_attributes = {
  'FilterPolicy': json.dumps({
    'eventType': ['sms']
  })
}

client.set_subscription_attributes(
  SubscriptionArn=subscription_Sms['SubscriptionArn'],
  AttributeName='FilterPolicy',
  AttributeValue=sms_attributes['FilterPolicy']
)

# assinatura email
subscription_Email = client.subscribe(
  TopicArn=response['TopicArn'],
  Protocol='sms',  
  Endpoint='+5591981695389',  
  ReturnSubscriptionArn=True
)

email_attributes = {
  'FilterPolicy': json.dumps({
    'eventType': ['email']
  })
}

client.set_subscription_attributes(
  SubscriptionArn=subscription_Email['SubscriptionArn'],
  AttributeName='FilterPolicy',
  AttributeValue=email_attributes['FilterPolicy']
)

msg_email = client.publish(
    TopicArn=response['TopicArn'],
    Message='Esta é uma mensagem de teste para o filtro de email.',
    MessageAttributes={
        'eventType': {

            'StringValue': 'email'
        }
    }
)

msg_sms = client.publish(
    TopicArn=response['TopicArn'],
    Message='Esta é uma mensagem de teste para o filtro de sms.',
    MessageAttributes={
        'eventType': {
            'DataType': 'String',
            'StringValue': 'sms'
        }
    }
)

print("Mensagem publicada com sucesso:", response)