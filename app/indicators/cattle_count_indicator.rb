# coding: utf-8
class CattleCountIndicator < BaseIndicator

  def initialize(farm)
    @farm = farm
  end

  def label
    "Total de Cabeças"
  end

  def values
    BaseIndicator.date_range.map { |d| @farm.cattle_count_at(d) }
  end

end
