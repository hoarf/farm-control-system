class Farm < ActiveRecord::Base

  has_and_belongs_to_many :users

  has_many :creditors
  has_many :debtors
  has_many :accounts
  has_many :inventory

  def cattle_count_at(date)
    inventory.find_by(system_name: :females).total(date) +
      inventory.find_by(system_name: :males).total(date)
  end

  def cattle_food_at(date)
    inventory.find_by(system_name: :food).total(date)
  end

end
