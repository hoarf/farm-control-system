# coding: utf-8

class Fact < ActiveRecord::Base

  MOVES_COUNT_MIN = 2

  # Relationships
  has_many :moves, dependent: :destroy, inverse_of: :fact
  has_many :credits, dependent: :destroy
  has_many :debits, dependent: :destroy
  has_one :entry, dependent: :destroy
  belongs_to :partner

  # Saving
  accepts_nested_attributes_for :moves, allow_destroy: true
  accepts_nested_attributes_for :entry, allow_destroy: true

  # Validation
  validate :at_least_two_moves, :credits_and_debits_must_be_equal

  def credits_and_debits_must_be_equal
    unless moves.reject(&:marked_for_destruction?)
             .select { |m| m.valid? }
             .map { |m| m.type == "Debit" ? m.amount : - m.amount }.reduce(:+) == 0
      errors.add(:moves, "A soma dos créditos e débitos deve ser igual")
    end
  end

  def at_least_two_moves
    unless moves.reject(&:marked_for_destruction?).count >= MOVES_COUNT_MIN
      errors.add(:moves, "No mínimo duas movimentações financeiras são necessárias")
    end
  end

  def credits_of_cts_account_of(date)
       credits.of_cts_account.of(date).total
  end

  def debits_of_cts_account_of(date)
       debits.of_cts_account.of(date).total
  end

  def self.create_from_sale(sale, inventory, amount, total)
    unless amount == 0 # Amount 0 means no fact
      Fact.create do |f|
        cost = inventory.mpm(sale.date) * amount
        revenue = (sale.amount/total) * amount

        f.date = sale.date
        f.description = sale.description
        f.evidence = sale.evidence

        f.entry = Entry.new({type: 'Checkout', inventory: inventory, amount: amount})

        f.moves << Move.new({ amount: revenue, account: Account.sales_revenue, type: 'Credit' })
        f.moves << Move.new({ amount: revenue, account: Account.cash, type: 'Debit' })
        f.moves << Move.new({ amount: cost, account: Account.cost_to_sell, type: 'Debit' })
        f.moves << Move.new({ amount: cost, account: Account.inventory, type: 'Credit' })
      end
    end
  end

end
