class Entry < ActiveRecord::Base

  belongs_to :inventory
  belongs_to :fact

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates_presence_of :type, :amount, :inventory_id

  delegate :date, to: :fact, allow_nil: true

  scope :by_date, -> { joins(:fact).order('facts.date') }
  scope :of, ->(date) { joins(:fact).where(Fact.arel_table[:date].lteq(date)) }
  scope :total, -> { sum(:amount) }

end
