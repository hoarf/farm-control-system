# coding: utf-8

# Farm
alianca = Farm.create!({name: "Fazenda Aliança"})

# User
admin = User.create!({email: "admin@agropecuariaficagna.com", password: "111111", password_confirmation: "111111", farm: alianca })
admin.confirm

# Partners

# Accounts

expenses = Debtor.create!({ name: "Despesas", system_name: "expenses" })
financial_expenses = Debtor.create!({ name: "Despesas Financeiras", system_name: "financial_expenses" })

Debtor.create!({ name: "Custos de Mercadorias Vendidas", system_name: "cost_to_sell" })
Debtor.create!({ name: "Descontos", system_name: "discounts", parent: expenses })
Debtor.create!({ name: "Doações e Perdas", system_name: "loss", parent: expenses })
Debtor.create!({ name: "Impostos", system_name: "taxes", description: "ICMS, PIS, COFINS INSS a recolhidos, CSL, FGTS pagos", parent: expenses })

Debtor.create!({ name: "Caixa", system_name: "cash", description: "Dinheiro disponível e cheques não depositados" })
Debtor.create!({ name: "Banco", system_name: "bank", description: "Recursos nas contas bancárias" })
Debtor.create!({ name: "Aplicações", system_name: "investments", description: "Instrumentos financeiros" })
Debtor.create!({ name: "Clientes/Contas a Receber", system_name: "lendings", description: "Créditos concedidos à clientes" })
Debtor.create!({ name: "Imóveis", system_name: "real_state", description: "Uso e locação" })
Debtor.create!({ name: "Veículos", system_name: "vehicles" })
Debtor.create!({ name: "Móveis e Utensílios", system_name: "appliance" })
Debtor.create!({ name: "Instalações", system_name: "improvements" })

Debtor.create!({ name: "Depreciação", system_name: "depreciation", parent: expenses })
Debtor.create!({ name: "Salários e Encargos", system_name: "wages", parent: expenses, description: "Salários, Honorários, Comissões, Férias, Gratificações e Participações a pagar" })
Debtor.create!({ name: "Imposto de Renda", system_name: "income_tax" })

Creditor.create!({ name: "Receitas", system_name: "income" })
Creditor.create!({ name: "Empréstimos/Financiamentos", system_name: "liabilities", description: "Valores de terceiros emprestados à empresa", parent: financial_expenses })
Creditor.create!({ name: "Fornecedores", system_name: "suppliers", description: "Débitos com os fornecedores de mercadorias e matérias primas para a empresa" })
Creditor.create!({ name: "Impostos", system_name: "taxes_to_be_payed", description: "ICMS, PIS, COFINS INSS a recolher, CSL, FGTS a pagar" })
Creditor.create!({ name: "Contas a Pagar", system_name: "bills", description: "Aluguel, energia, seguros, fretes e outras despesas" })
Creditor.create!({ name: "Dividendos a Pagar", system_name: "dividends", description: "Parcela do lucro devida aos sócios ao final de cada exercício" })

Asset.create!({ name: "Capital", system_name: "capital" })
Asset.create!({ name: "Lucro Líquido", system_name: "profit" })

Account.find_each do |a|
  a.farm = alianca
  a.save
end

# Inventories

Inventory.create!({ item: "Machos", system_name: "males", unit: "Cabeças", farm: alianca, description: "Machos disponíveis para compra e venda."  })
Inventory.create!({ item: "Fêmeas", system_name: "females", unit: "Cabeças", farm: alianca, description: "Fêmeas disponíveis para compra e venda."  })
Inventory.create!({ item: "Silagem", system_name: "food", unit: "Kilos", farm: alianca, description: "Quantidade de Silagem na Fazenda"  })

# Partners

Partner.create!({ name: "Alan Ficagna", contact: "alan.ficagna@gmail.com" })
Partner.create!({ name: "Aline Maria Ficagna" })
Partner.create!({ name: "Mãe =)" })
