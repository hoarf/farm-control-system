# coding: utf-8
class INPC

  def initialize
    @raw = JSON.parse(File.read(File.join(Rails.root, 'config', 'data', 'inpc.json')))
  end

  def data
    values.map do |r|
      r["svalor"]
    end
  end

  def values
    @raw.first["valores"].select { |v| Date.new(v["ano"],v["mes"],v["dia"]) > 1.year.ago  }
  end

  def labels
    values.map do |r|
      Date.new(r["ano"],r["mes"],r["dia"])
    end
  end

  def to_json
    {
      labels: labels,
      datasets: [
        {
          data: data,
          label: "IPCA (%)",
          fill: false,
          backgroundColor: 'rgba(255,0,0,.5)'
        }
      ]
    }
  end

end
