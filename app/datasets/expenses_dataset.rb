class ExpensesDataset < Dataset

  def initialize(farm)
    @expenses = farm.debtors.joins(:parent).where('parents_accounts.system_name = ?', :expenses)
  end

  def title
    "Despesas"
  end

  def datasets
    colors = Colors.new
    [{
       data: @expenses.to_a.map { |e| ExpensesIndicator.new(e).values },
       label: "Despesas",
       backgroundColor: @expenses.to_a.map { colors.next }
    }]
  end

  def options
    {
      title: { display: true, text: title },
      legend: { display: false }
    }
  end

  def labels
    @expenses.to_a.map { |e| e.name }
  end

end
