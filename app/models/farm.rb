class Farm < ActiveRecord::Base

  has_and_belongs_to_many :users, dependent: :nullify

  has_many :creditors, dependent: :delete_all
  has_many :debtors, dependent: :delete_all
  has_many :accounts, dependent: :delete_all
  has_many :inventory, dependent: :delete_all

  def cattle_count_at(date)
    inventory.females.balance(date) + inventory.males.balance(date)
  end

  def cattle_food_at(date)
    inventory.food.balance(date)
  end

end
