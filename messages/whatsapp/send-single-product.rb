require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
WHATSAPP_SENDER_ID = ENV['WHATSAPP_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']
WHATSAPP_CATALOG_ID = ENV['WHATSAPP_CATALOG_ID']
WHATSAPP_PRODUCT_ID_1 = ENV['WHATSAPP_PRODUCT_ID_1']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.whatsapp(
  type: 'custom',
  message: {
    type: "interactive",
    interactive: {
      type: "product",
      body: {
        text: "Check out this cool product"
      },
      footer: {
        text: "Sale now on!"
      },
      action: {
        catalog_id: WHATSAPP_CATALOG_ID,
        product_retailer_id: WHATSAPP_PRODUCT_ID_1
      }
    }
  }
)

client.messaging.send(
  from: WHATSAPP_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
