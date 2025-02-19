require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
GEOSPECIFIC_VONAGE_API_HOST = ENV['GEOSPECIFIC_VONAGE_API_HOST']
MESSAGES_MESSAGE_ID = ENV['MESSAGES_MESSAGE_ID']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY,
  api_host: GEOSPECIFIC_VONAGE_API_HOST
)

client.messaging.update(
  message_uuid: MESSAGES_MESSAGE_ID,
  status: 'revoked'
)