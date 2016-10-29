class ExpensesIndicator < BaseIndicator

  def initialize(debtor)
    @debtor = debtor
  end

  def label
    @debtor.name
  end

  def values
    [ @debtor.balance ]
  end
end
