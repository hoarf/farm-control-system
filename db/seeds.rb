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
Creditor.create!({  name: "Capital"     })
Debtor.create!({    name: "Despesas"    })
Creditor.create!({  name: "Receitas"    })
Debtor.create!({    name: "Mercadorias" })
Debtor.create!({    name: "Custos"      })
Debtor.create!({    name: "Depreciação"      })

# Inventories
Inventory.create!({ item: "Machos" })
Inventory.create!({ item: "Fêmeas" })

# Partners

Partner.create!({ name: "Alan Ficagna", contact: "alan.ficagna@gmail.com" })
Partner.create!({ name: "Aline Maria Ficagna" })
Partner.create!({ name: "Mãe =)" })
