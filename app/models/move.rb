class Move < ActiveRecord::Base
  include ArelHelpers::ArelTable

  scope :names, -> { includes(:account).pluck(:name).join(", ") }
  scope :totals, -> { select(:account_id, Move[:amount].sum.as("amount")).group(:account_id) }
  scope :of, -> (date) { joins(:fact).where('facts.date between ? and ?', date - 1.year, date) }

  belongs_to :fact
  belongs_to :account

  delegate :date, to: :fact, allow_nil: true
  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }

  validates_presence_of :account_id, :amount, :type

end
