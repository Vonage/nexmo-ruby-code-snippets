require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
ROOM_DISPLAY_NAME = ENV['ROOM_DISPLAY_NAME']
EXPIRATION_DATE = ENV['EXPIRATION_DATE']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

room = client.meetings.rooms.create(
  display_name: ROOM_DISPLAY_NAME,
  type: 'long_term',
  expires_at: EXPIRATION_DATE
)
