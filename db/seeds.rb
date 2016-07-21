# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create!({email: "admin@agropecuariaficagna.com", password: "111111", password_confirmation: "111111"})
u.confirm
f = Farm.create!({name: "Fazenda Aliança"})
u.farms << f
u.save!
