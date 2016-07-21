class BalanceChange < ActiveRecord::Base
  belongs_to :balanceable, polymorphic: true
  validates :amount, numericality: true
end
