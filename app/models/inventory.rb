class Inventory < ActiveRecord::Base
  include ArelHelpers::ArelTable

  has_many :entries, dependent: :destroy
  has_many :checkins, dependent: :destroy
  has_many :checkouts, dependent: :destroy

  belongs_to :farm

  accepts_nested_attributes_for :entries, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :item, :date, :initial_amount, :initial_balance

  after_initialize { |i| i.date ||= Date.today if new_record? }

  def total(date=Date.today)
    initial_amount + checkins.of(date).sum(:amount) - checkouts.of(date).sum(:amount)
  end

  def to_s
    item
  end

  def mpms
    c = []
    checkins.by_date.each do |ci|
      counted = checkins.select { |ca| ca.date <= ci.date }
      c << safe_div(counted.sum(&:total), counted.sum(&:amount))
    end
    c
  end

  def mpm
    mpms.last
  end

  def balance(date=Date.today)
    initial_balance + checkins.of(date).to_a.sum(&:total) - checkouts.of(date).to_a.sum(&:total)
  end

  def self.males
    Inventory.find_by system_name: :males
  end

  def self.females
    Inventory.find_by system_name: :females
  end

  private

  def safe_div(n1,n2)
    begin
      n1/n2
    rescue
      0
    end
  end



end
