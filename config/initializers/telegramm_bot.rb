
CHAT_ID = (Rails.env.production? ? ENV['PRODUCTION_CHAT_ID'] : ENV['DEVELOPMENT_CHAT_ID']).to_i

RT_BOT = Telegrammer::Bot.new(ENV['BOT_TOKEN'])

# todo : place this address to env
# todo : process response
response = RT_BOT.set_webhook(ENV['HANDLE_URL'])
