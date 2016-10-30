# coding: utf-8

class FarmPresenter < BasePresenter

  attr_accessor :dre, :balance_sheet, :profitability,
                :inventory_levels, :expenses

  def initialize(model, view)
    @dre = Dre.new
    @balance_sheet = BalanceSheet.new
    @profitability = ProfitabilityDataset.new
    @inventory_levels = InventoryLevelsDataset.new(model)
    @expenses = ExpensesDataset.new(model)
    super
  end

end
