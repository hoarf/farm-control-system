# coding: utf-8

class Dre

  def initialize(date=Date.today)
    @date = date
    @accounts = Account.of(date)
  end

  def method_missing(method_sym, *arguments, &block)
    if Account.system_names.include?(method_sym.to_s)
      Account.find_by(system_name: method_sym).balance(date)
    else
      super
    end
  end

  def respond_to?(method_sym, include_private=false)
    Account.system_names.include?(method_sym.to_s) or super
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
