# require 'discordrb/webhooks'

# WEBHOOK_URL = 'https://discord.com/api/webhooks/817001920454852609/ODE3MDAxOTIwNDU0ODUyNjA5.YEDKVA.6_5_0XEwWcQMyEavskHFoXnKVrE'.freeze

# client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
# client.execute do |builder|
#   builder.content = 'Hello world!'
#   builder.add_embed do |embed|
#     embed.title = 'Embed title'
#     embed.description = 'Embed description'
#     embed.timestamp = Time.now
#   end
# end
require 'discordrb'

$bot = Discordrb::Bot.new token: ENV["DISCORD_KEY"]

$bot.message(with_text: 'Ping!') do |event|
  event.respond 'Pong!'
end

# $bot.run
