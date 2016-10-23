class Entry < ActiveRecord::Base

  belongs_to :inventory
  belongs_to :move

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates_presence_of :type, :amount, :inventory_id

  delegate :date, to: :move, allow_nil: true

  scope :of, ->(date) { eager_load(move: [:fact]).where('facts.date <= ?', date) }

  def total
    move.amount
  end

  def cost
    total/amount
  end

end
