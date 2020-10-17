require 'discordrb'
require 'dotenv'
require_relative 'lib/irb'

Dotenv.load

bot = Discordrb::Bot.new token: ENV["TOKEN"]
hash = {}

# "irb"が送られたとき IRB.newして、hshに入れる


bot.message() do |event|
  if hash.include? user
    hash[user].input event.content
    event.respond hash[user].result_str
  end
end

bot.run
