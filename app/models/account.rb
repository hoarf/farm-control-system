class Account < ActiveRecord::Base
  has_many :debits, class_name: "Move", foreign_key: :debit_id
  has_many :credits, class_name: "Move", foreign_key: :credit_id

  validates_presence_of :type, :name, :start

  def balance
    credits.sum(:amount) - debits.sum(:amount)
  end

end
