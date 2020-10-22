# irbを実装するよ

# TOODO override stdout


class MyIrb
  attr_reader :content, :returned
  def initialize
    @content = ""
    @returned = nil
  end

  def input(text)
    reutrn nil unless _safe?(text)

    # eval & save text
    begin
      # TODO "def ~ "を入力するとエラーになる
      @returned = eval(text)
    rescue => e
      p e.class
      p e.message
    else
      @content += text
      print "=> "
      p @returned
    end
  end

  def _safe?(text)
    # TODO blocking Unsafe code like system()
    true
  end
end
