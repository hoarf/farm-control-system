class Move < ActiveRecord::Base

  scope :names, -> { includes(:account).pluck(:name) }
  scope :totals, -> { sum(:amount) }

  belongs_to :fact
  belongs_to :account

  delegate :date, to: :fact, allow_nil: true
  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }

  validates_presence_of :account_id, :amount, :type

end
