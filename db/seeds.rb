# coding: utf-8

# Farm
alianca = Farm.create!({name: "Fazenda Aliança"})

# User
admin = User.create!({email: "admin@agropecuariaficagna.com",
                      password: "111111",
                      password_confirmation: "111111", farm: alianca })
admin.confirm

# Accounts

Debtor.create!({ name: "Despesas", system_name: "expenses" })
Debtor.create!({ name: "Despesas Financeiras", system_name: "financial_expenses" })
Debtor.create!({ name: "Mercadorias", system_name: "inventory" })
Debtor.create!({ name: "Custos de Mercadorias Vendidas", system_name: "cost_to_sell" })
Debtor.create!({ name: "Devoluções", system_name: "returns" })
Debtor.create!({ name: "Descontos", system_name: "discounts" })
Debtor.create!({ name: "Caixa", system_name: "cash", description: "Dinheiro disponível e cheques não depositados" })
Debtor.create!({ name: "Banco", system_name: "bank", description: "Recursos nas contas bancárias" })
Debtor.create!({ name: "Aplicações", system_name: "investments", description: "Instrumentos financeiros" })
Debtor.create!({ name: "Clientes/Contas a Receber", system_name: "lendings", description: "Créditos concedidos à clientes" })
Debtor.create!({ name: "Imóveis", system_name: "real_state", description: "Uso e locação" })
Debtor.create!({ name: "Veículos", system_name: "vehicles" })
Debtor.create!({ name: "Móveis e Utensílios", system_name: "appliance" })
Debtor.create!({ name: "Instalações", system_name: "improvements" })

Creditor.create!({ name: "Depreciação", system_name: "depreciation" })
Creditor.create!({ name: "Imposto de Renda", system_name: "income_tax" })
Creditor.create!({ name: "Receitas", system_name: "income" })
Creditor.create!({ name: "Capital", system_name: "capital" })
Creditor.create!({ name: "Lucro Líquido", system_name: "profit" })
Creditor.create!({ name: "Empréstimos/Financiamentos", system_name: "liabilities",
                   description: "Valores de terceiros emprestados à empresa" })
Creditor.create!({ name: "Fornecedores", system_name: "suppliers",
                   description: "Débitos com os fornecedores de mercadorias e matérias primas para a empresa" })
Creditor.create!({ name: "Salários e Encargos", system_name: "wages",
                   description: "Salários, Honorários, Comissões, Férias, Gratificações e Participações a pagar" })
Creditor.create!({ name: "Impostos", system_name: "taxes",
                   description: "ICMS, PIS, COFINS INSS a recolher, CSL, FGTS a pagar" })
Creditor.create!({ name: "Contas a Pagar", system_name: "taxes",
                   description: "Aluguel, energia, seguros, fretes e outras despesas" })
Creditor.create!({ name: "Dividendos a Pagar", system_name: "taxes",
                   description: "Parcela do lucro devida aos sócios ao final de cada exercício" })

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
