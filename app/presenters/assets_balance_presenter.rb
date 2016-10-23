class AssetsBalancePresenter

  def initialize
    @debtors = Debtor.all
    @creditors = Creditor.all
   end

  def actives
    @debtors.map { |d| "#{d.name} ... #{d.balance}" }
  end

  def passives
    @creditors.where.not(system_name: "capital").map { |d| "#{d.name} ... #{d.balance}" }
  end

  def pl
    @creditors.find_by(system_name: "capital").instance_eval { |a| "#{a.name} ... #{a.balance}" }
  end

  def total_actives
    @debtors.to_a.sum &:balance
  end

  def total_passives
    @creditors.to_a.sum &:balance
  end

end
