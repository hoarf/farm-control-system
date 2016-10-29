# coding: utf-8

class FarmPresenter < BasePresenter

  attr_accessor :dre, :assets_balance, :profitability, :inventory_levels

  def initialize(model, view)
    @dre = DrePresenter.new
    @assets_balance = AssetsBalancePresenter.new
    @profitability = ProfitabilityDataset.new(self)
    @inventory_levels = InventoryLevelsDataset.new(self)
    super
  end

end
