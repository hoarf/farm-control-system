# coding: utf-8

# Farm
alianca = Farm.create!({name: "Fazenda Aliança"})

# User
admin = User.create!({
               email: "admin@agropecuariaficagna.com",
               password: "111111",
               password_confirmation: "111111",
               farm: alianca
                     })

admin.confirm

# Accounts
Creditor.create!({ name: "Capital" })
Debitor.create!({ name: "Despesas" })
Debitor.create!({ name: "Despesas Financeiras" })
Creditor.create!({ name: "Imposto de Renda" })
Creditor.create!({ name: "Receitas" })
Debtor.create!({ name: "Mercadorias" })
Debtor.create!({ name: "Custos de Mercadorias Vendidas" })
Creditor.create!({ name: "Depreciação" })
Debtor.create!({ name: "Devoluções" })
Debtor.create!({ name: "Descontos" })
Debitor.create!({ name: "Impostos" })

# Inventories
Inventory.create!({ item: "Machos", description: "Machos disponíveis para compra e venda."  })
Inventory.create!({ item: "Fêmeas", description: "Fêmeas disponíveis para compra e venda."  })

# Partners

Partner.create!({ name: "Alan Ficagna", contact: "alan.ficagna@gmail.com" })
Partner.create!({ name: "Aline Maria Ficagna" })
Partner.create!({ name: "Mãe =)" })
