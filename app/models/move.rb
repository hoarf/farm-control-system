# coding: utf-8

# This class models a financial movement in the system.
class Move < ActiveRecord::Base

  scope :with_facts, -> { joins(:fact) }
  scope :with_accounts, -> { joins(:account) }
  scope :of, -> (date) { where('facts.date between ? and ?', date - 1.year, date) }
  scope :in, -> (account) { where(Account[:system_name].eq(account)) }
  scope :of_date, -> (date) { with_facts.of(date).total }
  scope :of_account, -> (date, account) { with_facts.with_accounts.of(date).in(account).total }
  scope :total, -> { sum(:amount) }

  belongs_to :fact
  belongs_to :account

  delegate :date, to: :fact, allow_nil: true

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }

  validates_presence_of :account_id, :amount, :type

end
