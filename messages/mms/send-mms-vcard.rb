require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
MMS_SENDER_ID = ENV['MMS_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']
MESSAGES_VCARD_URL = ENV['MESSAGES_VCARD_URL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.mms(
  type: 'vcard',
  message: {
    url: MESSAGES_VCARD_URL
  }
)

client.messaging.send(
  from: MMS_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
