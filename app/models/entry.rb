# This class represents a new entry in the inventory control sheet.
class Entry < ActiveRecord::Base

  scope :with_facts, -> { joins(:fact) }
  scope :by_date, -> { with_facts.order(Fact[:date]) }
  scope :of, ->(date) { with_facts.where(Fact[:date].lteq(date)).total }
  scope :total, -> { sum(:amount) }

  belongs_to :inventory
  belongs_to :fact

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates_presence_of :type, :amount, :inventory_id

  delegate :date, to: :fact
end
