# coding: utf-8
class CattleCountIndicator < BaseIndicator

  def initialize(farm)
    @farm = farm
  end

  def background_color
    "rgb(255,0,0)"
  end

  def label
    "Total de Cabeças"
  end

  def values
    BaseIndicator.date_range.map { |d| @farm.cattle_count_at(d) }
  end

end
