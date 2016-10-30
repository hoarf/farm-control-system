# coding: utf-8
class DrePresenter < BasePresenter

  def initialize(model, view)
    @accounts = Account.of(Date.today)
    super(model, view)
  end

  def method_missing(method_sym, *arguments, &block)
    if Account.system_names.include?(method_sym.to_s)
      Account.with_balance(@accounts.of_sysname(method_sym))
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
    income - discounts - loss - taxes
  end

end
