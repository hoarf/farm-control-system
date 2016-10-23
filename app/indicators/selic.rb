# coding: utf-8

class Selic < BaseIndicator

  def initialize
    super('selic.json')
  end

  def to_json
    {
      data: data,
      label: "Selic (%)",
      fill: false,
      backgroundColor: 'rgba(0,0,255,.5)'
    }
  end

end
