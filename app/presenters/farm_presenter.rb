# coding: utf-8

class FarmPresenter < BasePresenter

  attr_accessor :dre, :assets_balance, :profitability,
                :inventory_levels, :expenses

  def initialize(model, view)
    @dre = DrePresenter.new(model, view)
    @assets_balance = AssetsBalancePresenter.new
    @profitability = ProfitabilityDataset.new(model)
    @inventory_levels = InventoryLevelsDataset.new(model)
    @expenses = ExpensesDataset.new(model)
    super
  end

end
