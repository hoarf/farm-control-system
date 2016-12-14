# coding: utf-8

class Move < ActiveRecord::Base

  scope :of, -> (date) { joins(:fact).where('facts.date between ? and ?', date - 1.year, date) }
  scope :of_cts_account, -> { where(account: { sytem_name: :cts }) }
  scope :total, -> { sum(:amount) }

  belongs_to :fact
  belongs_to :account

  delegate :date, to: :fact, allow_nil: true

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }

  validates_presence_of :account_id, :amount, :type

end
