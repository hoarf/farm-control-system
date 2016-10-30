class ProfitIndicator < BaseIndicator

  def label
    "Fazenda (%)"
  end

  def values
    BaseIndicator.date_range.map do |d|
      100 * (Dre.new(d).net_profit / Account.capital.balance)
    end
  end

  def background_color
    'rgba(255,0,0,1)'
  end

end
