class ProfitIndicator < BaseIndicator

  def label
    "Fazenda (%)"
  end

  def values
    BaseIndicator.date_range.map { |d| Dre.new(d).net_profit }
  end

  def background_color
    'rgba(255,0,0,1)'
  end

end
