# coding: utf-8
class Selic

  def initialize
    @raw = JSON.parse(File.read(File.join(Rails.root, 'config', 'data', 'selic.json')))
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
          label: "Selic (%)",
          fill: false,
          backgroundColor: 'rgba(0,0,255,.5)'
        }
      ]
    }
  end

end
