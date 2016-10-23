# coding: utf-8

# Farm
alianca = Farm.create!({name: "Fazenda Aliança"})

# User
admin = User.create!({email: "admin@agropecuariaficagna.com",
                      password: "111111",
                      password_confirmation: "111111", farm: alianca })
admin.confirm

# Accounts
Creditor.create!({ name: "Capital", system_name: "capital" })
Debtor.create!({ name: "Despesas", system_name: "expenses" })
Debtor.create!({ name: "Despesas Financeiras", system_name: "financial_expenses" })
Creditor.create!({ name: "Imposto de Renda", system_name: "income_tax" })
Creditor.create!({ name: "Receitas", system_name: "income" })
Debtor.create!({ name: "Mercadorias", system_name: "inventory" })
Debtor.create!({ name: "Custos de Mercadorias Vendidas", system_name: "cost_to_sell" })
Creditor.create!({ name: "Depreciação", system_name: "depreciation" })
Debtor.create!({ name: "Devoluções", system_name: "returns" })
Debtor.create!({ name: "Descontos", system_name: "discounts" })
Debtor.create!({ name: "Impostos", system_name: "taxes" })

# Inventories
Inventory.create!({ item: "Machos", system_name: "males", unit: "Cabeças",
                    description: "Machos disponíveis para compra e venda."  })
Inventory.create!({ item: "Fêmeas", system_name: "females", unit: "Cabeças",
                    description: "Fêmeas disponíveis para compra e venda."  })
Inventory.create!({ item: "Silagem", system_name: "food", unit: "Kilos",
                    description: "Quantidade de Silagem na Fazenda"  })

# Partners

Partner.create!({ name: "Alan Ficagna", contact: "alan.ficagna@gmail.com" })
Partner.create!({ name: "Aline Maria Ficagna" })
Partner.create!({ name: "Mãe =)" })
