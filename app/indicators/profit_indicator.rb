class ProfitIndicator < BaseIndicator

  def initialize(farm)
    @farm = farm
  end

  def label
    "Rendimento (%)"
  end

  def values
    BaseIndicator.date_range.map { |d| @farm.profit_at(d) }
  end

  def background_color
    'rgba(255,0,0,1)'
  end

end
