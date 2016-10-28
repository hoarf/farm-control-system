class ProfitabilityDataset < Dataset

  def title
    "Lucratividade"
  end

  def initialize(farm)
    @farm = farm
  end

  def datasets
    [ Selic.new.data, INPC.new.data, ProfitIndicator.new(@farm).data ]
  end

end
