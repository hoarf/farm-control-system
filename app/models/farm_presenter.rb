# coding: utf-8
class FarmPresenter < BasePresenter

  def gross_revenue
    Account.find_by(name: "Receitas").balance
  end

  def net_revenue
    gross_revenue - discounts - devolutions - taxes
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

  def discounts
    Account.find_by(name: "Descontos").balance
  end

  def devolutions
    Account.find_by(name: "Devoluções").balance
  end

  def cts
    Account.find_by(name: "Custos de Mercadorias Vendidas").balance
  end

  def expenses
    Account.find_by(name: "Despesas").balance
  end

  def taxes
    Account.find_by(name: "Impostos").balance
  end

  def financial_expenses
    Account.find_by(name: "Despesas Financeiras").balance
  end

  def income_tax
    Account.find_by(name: "Imposto de Renda").balance
  end

end