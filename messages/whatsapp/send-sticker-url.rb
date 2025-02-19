require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
WHATSAPP_SENDER_ID = ENV['WHATSAPP_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']
WHATSAPP_STICKER_URL = ENV['WHATSAPP_STICKER_URL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.whatsapp(
  type: 'sticker',
  message: {
    url: WHATSAPP_STICKER_URL
  }
)

client.messaging.send(
  from: WHATSAPP_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
