class CattleFoodIndicator < BaseIndicator

  def initialize(farm)
    @farm = farm
  end

  def label
    "Quantidade de Silagem"
  end

  def values
    BaseIndicator.date_range.map { |d| @farm.cattle_food_at(d) }
  end

end
