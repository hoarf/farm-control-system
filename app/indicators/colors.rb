class Colors

  def initialize
    @red = 50
    @green = 100
    @blue = 100
  end

  def next
    @red += 40
    "rgba(#{@red},#{@green},#{@blue},1)"
  end

end
