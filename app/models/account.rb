class Account < ActiveRecord::Base

  has_many :debits
  has_many :credits
  has_many :moves

  validates_presence_of :type, :name, :start

end
