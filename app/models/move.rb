class Move < ActiveRecord::Base

  belongs_to :fact, inverse_of: :moves
  belongs_to :account
  belongs_to :partner

  delegate :date, to: :fact, allow_nil: true
  delegate :name, to: :account, allow_nil: true, prefix: true

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
  validates_presence_of :account_id, :amount, :type

end
