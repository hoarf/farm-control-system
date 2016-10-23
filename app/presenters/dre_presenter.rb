# coding: utf-8
class DrePresenter

  def initialize
    @accounts = Account.all
  end

  def gross_result
    net_revenue - cts
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
    gross_revenue - discounts - devolutions - taxes
  end

  def gross_revenue
    @accounts.find_by(system_name: "income").balance
  end

  def discounts
    @accounts.find_by(system_name: "discounts").balance
  end

  def devolutions
    @accounts.find_by(system_name: "returns").balance
  end

  def cts
    @accounts.find_by(system_name: "cost_to_sell").balance
  end

  def expenses
    @accounts.find_by(system_name: "expenses").balance
  end

  def taxes
    @accounts.find_by(system_name: "taxes").balance
  end

  def financial_expenses
    @accounts.find_by(system_name: "financial_expenses").balance
  end

  def income_tax
    @accounts.find_by(system_name: "income_tax").balance
  end

end
