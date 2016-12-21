# Factory class for creating Facts
class  FactFactory

  def self.create_from_sale(sale, inventory, amount_inventory, amount)
    unless amount_inventory == 0 # Amount 0 means no fact
      Fact.create do |f|
        cost = inventory.mpm(sale.date) * amount_inventory
        revenue = (sale.amount/amount) * amount_inventory

        f.date = sale.date
        f.description = sale.description
        f.evidence = sale.evidence

        f.entry = Entry.new({type: 'Checkout', inventory: inventory, amount: amount_inventory})

        f.moves << Move.new({ amount: revenue, account: Account.sales_revenue, type: 'Credit' })
        f.moves << Move.new({ amount: revenue, account: Account.cash, type: 'Debit' })
        f.moves << Move.new({ amount: cost, account: Account.cost_to_sell, type: 'Debit' })
        f.moves << Move.new({ amount: cost, account: Account.inventory, type: 'Credit' })
      end
    end
  end

  def self.create_from_buy(buy, inventory, amount_inventory, amount)
    unless amount_inventory == 0 # Amount 0 means no fact
      Fact.create do |f|
        per = (buy.amount/amount) * amount_inventory

        f.date = buy.date
        f.description = buy.description
        f.evidence = buy.evidence

        f.entry = Entry.new({type: 'Checkin', inventory: inventory, amount: amount_inventory})

        f.moves << Move.new({ amount: buy.amount, account: Account.cash, type: 'Credit' })
        f.moves << Move.new({ amount: buy.amount, account: Account.inventory, type: 'Debit' })
      end
    end
  end

end
