class Buy < Deal

  def create_facts
    amount = amount_males + amount_females
    FactFactory.create_from_buy(self, Inventory.males, amount_males, amount)
    FactFactory.create_from_buy(self, Inventory.females, amount_females, amount)
  end

end
