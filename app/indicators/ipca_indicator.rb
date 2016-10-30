# coding: utf-8

class IPCAIndicator < BaseFileIndicator

  def initialize
    super('inpc.json')
  end

  def label
    "IPCA (%)"
  end

  def background_color
    'rgba(100,100,100,1)'
  end

end
