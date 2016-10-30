class CattleFoodIndicator < BaseIndicator

  def initialize(farm)
    @farm = farm
  end

  def background_color
    "rgb(100,100,100)"
  end

  def label
    "Quantidade de Silagem"
  end

  def values
    BaseIndicator.date_range.map { |d| @farm.cattle_food_at(d) }
  end

  def axis
    "y-axis-1"
  end

end
