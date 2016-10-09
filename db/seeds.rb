# coding: utf-8

f = Farm.create!({name: "Fazenda Aliança"})

u = User.create!({email: "admin@agropecuariaficagna.com", password: "111111", password_confirmation: "111111"})
u.confirm
u.farm = f
u.save!

Debtor.create!({name: "Capital"})
Creditor.create!({name: "Mercadoria"})
