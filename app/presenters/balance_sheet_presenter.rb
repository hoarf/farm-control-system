class BalanceSheetPresenter < BasePresenter

  def actives
    debtors.map { |d| "#{d.name} ... #{h.number_to_currency(d.balance)}" }
  end

  def passives
    creditors.map { |d| "#{d.name} ... #{h.number_to_currency(d.balance)}"  }
  end

  def pl
    assets.map { |a| "#{a.name} ... #{h.number_to_currency(a.balance)}" }
  end

  def total_actives
    h.number_to_currency(super)
  end

  def total_passives
    h.number_to_currency(super)
  end

end
