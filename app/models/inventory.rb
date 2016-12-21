# coding: utf-8

class Inventory < ActiveRecord::Base

  # Required Objects in the system
  scope :males, -> { find_by(system_name: :males) }
  scope :females, -> { find_by(system_name: :females) }
  scope :food, -> { find_by(system_name: :food) }

  # Relationships
  has_many :entries, dependent: :destroy
  has_many :checkouts, dependent: :destroy
  has_many :checkins, dependent: :destroy
  belongs_to :farm

  # Validation
  validates_presence_of :item, :date

  # Initialization
  after_initialize { |i| i.date ||= Date.today if new_record? }

  def balance(date=Date.today)
    checkins.of(date) - checkouts.of(date)
  end

  Mpm = Struct.new(:date, :value)

  def mpms
    checkins.map do |checkin|
      entries_sum = checkins.of(checkin.date) - checkouts.of(checkin.date)

      moves_sum = checkin.fact.credits_of_cts_account_of(checkin.date) -
                  checkin.fact.debits_of_cts_account_of(checkin.date)

      mpm_value = if entries_sum != 0 then moves_sum/entries_sum else 0 end
      Mpm.new(checkin.date, mpm_value)
    end
  end

  def mpm(date=Date.today)
    mpms.select { |m| m.date <= date }.last || 0
  end

end
