class ExpensesDataset < Dataset

  def initialize(farm)
    @expenses = farm.debtors.joins(:parent).where('parents_accounts.system_name = ?', :expenses)
  end

  def title
    "Gastos"
  end

  def datasets
    @expenses.to_a.map { |e| ExpensesIndicator.new(e).data }
  end

  def labels
    @expenses.to_a.map { |e| e.name }
  end

end
