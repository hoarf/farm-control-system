# coding: utf-8
class InventoryLevelsDataset < Dataset

  def initialize(farm)
    @farm = farm
  end

  def title
    "Nível do estoque"
  end

  def datasets
    [ CattleCountIndicator.new(@farm).data, CattleFoodIndicator.new(@farm).data  ]
  end

end
