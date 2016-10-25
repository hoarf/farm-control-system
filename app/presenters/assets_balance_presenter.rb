class AssetsBalancePresenter

  def initialize
    @debtors = Debtor.all
    @creditors = Creditor.all
    @assets = Asset.all
   end

  def actives
    @debtors.map { |d| "#{d.name} ... #{d.balance}" }
  end

  def passives
    @creditors.map { |d| "#{d.name} ... #{d.balance}" }
  end

  def pl
    @assets.map { |a| "#{a.name} ... #{a.balance}" }
  end

  def total_actives
    @debtors.to_a.sum &:balance
  end

  def total_passives
    @creditors.to_a.sum(&:balance) + @assets.to_a.sum(&:balance)
  end

end
