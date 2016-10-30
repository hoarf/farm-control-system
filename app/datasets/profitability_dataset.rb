class ProfitabilityDataset < Dataset

  def title
    "Rendimentos"
  end

  def datasets
    [ SelicIndicator.new.data, IPCAIndicator.new.data, ProfitIndicator.new.data ]
  end

end
