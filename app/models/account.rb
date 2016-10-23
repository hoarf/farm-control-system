class Account < ActiveRecord::Base

  scope :moves, -> { joins(:credits, :debits) }

  has_many :debits, class_name: "Move", foreign_key: :debit_id
  has_many :credits, class_name: "Move", foreign_key: :credit_id

  validates_presence_of :type, :name, :start

end
