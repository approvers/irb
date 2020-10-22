require "pp"
require_relative "lib/my-irb"


# テスト用のコンソール


irb = MyIrb.new
content = ""

loop do
  print "console.rb> "
  content = gets
  break if content.chomp == "exit"

  irb.input(content)
end
