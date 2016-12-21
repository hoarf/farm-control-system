# coding: utf-8

class Sale < Deal

  def create_facts
    total = amount_males + amount_females
    FactFactory.create_from_sale(self, Inventory.males, amount_males, total)
    FactFactory.create_from_sale(self, Inventory.females, amount_females, total)
  end

end
