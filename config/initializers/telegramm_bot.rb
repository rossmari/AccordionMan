CHAT_ID = (Rails.env.production? ? ENV['PRODUCTION_CHAT_ID'] : ENV['DEVELOPMENT_CHAT_ID']).to_i

begin
  RT_BOT = Telegrammer::Bot.new(ENV['BOT_TOKEN'])
  response = RT_BOT.set_webhook(ENV['HANDLE_URL'])
  puts "This is the response: #{ response.body}"
rescue StandardError => exception
  puts "Telegram bot connection raise an error: #{exception}"
end




