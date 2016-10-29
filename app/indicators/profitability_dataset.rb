class ProfitabilityDataset < Dataset

  def title
    "Rendimentos"
  end

  def initialize(farm)
    @farm = farm
  end

  def datasets
    [ Selic.new.data, INPC.new.data, ProfitIndicator.new(@farm).data ]
  end

end
