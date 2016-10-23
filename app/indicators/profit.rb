class Profit

  def initialize(profit)
    @profit = profit
  end


  def to_json
    {
      label: "Rendimento",
      backgroundColor: 'rgba(0,255,0,.3)',
      data: []
    }
  end

end
