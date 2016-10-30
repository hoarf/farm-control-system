# coding: utf-8

class SelicIndicator < BaseFileIndicator

  def initialize
    super('selic.json')
  end

  def label
    "Selic (%)"
  end

  def background_color
    'rgba(200,200,200,1)'
  end

end
