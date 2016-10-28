# coding: utf-8
class DrePresenter

  def initialize(date=Date.today)
    @accounts = Account.of(date)
  end

  def method_missing(method_sym, *arguments, &block)
    if Account.system_names.include?(method_sym.to_s)
      Account.with_balance(@accounts.of_system_name(method_sym))
    else
      super
    end
  end

  def gross_result
    net_revenue - cost_to_sell
  end

  def operational_result
    gross_result - expenses
  end

  def before_ir_result
    operational_result - financial_expenses
  end

  def net_profit
    before_ir_result - income_tax
  end

  def net_revenue
    income - discounts - returns - taxes
  end

end
