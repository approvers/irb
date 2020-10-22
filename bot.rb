require 'discordrb'
require 'dotenv'
require_relative 'lib/my-irb'


# [!] 今の状態だとインジェクションを起こしちゃうので注意!!


Dotenv.load

bot = Discordrb::Bot.new token: ENV["TOKEN"]
hash = {}


bot.message() do |event|
  # TODO    plz help : userの取りかた分からん

  if event.content == "irb" && !hash.include?(user)
    hash[user] = Irb.new
    return
  end

  if event.content == "exit" && hash.include?(user)
    hash.delete(user)
    return
  end

  if hash.include?(user)
    hash[user].input(event.content)
    event.respond hash[user].result_str
  end
end

bot.run
