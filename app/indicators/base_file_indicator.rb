class BaseFileIndicator < BaseIndicator

  def initialize(file)
    @raw = JSON.parse(File.read(File.join(Rails.root, 'config', 'data', file)))
  end

  def filter
    @raw.first["valores"].select { |v| Date.new(v["ano"],v["mes"],v["dia"]) > 1.year.ago  }
  end

  def values
    filter.map { |r| r["svalor"] }
  end

  def label
    values.map { |r| Date.new(r["ano"],r["mes"],r["dia"]) }
  end

end
