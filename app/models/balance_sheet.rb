class BalanceSheet

  attr_accessor :debtors, :creditors, :assets

  def initialize
    @debtors = Debtor.parentables
    @creditors = Creditor.parentables.where.not(type: "Asset")
    @assets = Asset.parentables
   end

  def total_actives
    @debtors.to_a.sum(&:balance)
  end

  def total_passives
    @creditors.to_a.sum(&:balance) + @assets.to_a.sum(&:balance)
  end

end
