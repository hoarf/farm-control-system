class BaseIndicator

  def initialize(file)
    @raw = JSON.parse(File.read(File.join(Rails.root, 'config', 'data', file)))
  end

  def self.date_range
    (0..11).collect { |i| i.months.ago.at_beginning_of_month.to_date }.reverse
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

end
