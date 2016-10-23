# coding: utf-8

class INPC < BaseIndicator

  def initialize
    super('inpc.json')
  end

  def to_json
    {
      data: data,
      label: "IPCA (%)",
      fill: false,
      backgroundColor: 'rgba(255,0,0,.5)'
    }
  end

end
