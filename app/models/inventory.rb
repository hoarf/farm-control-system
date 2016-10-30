class Inventory < ActiveRecord::Base

  has_many :entries, dependent: :delete_all
  has_many :checkins
  has_many :checkouts

  belongs_to :farm

  accepts_nested_attributes_for :entries, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :item, :date, :initial_amount, :initial_balance

  after_initialize { |i| i.date ||= Date.today if new_record? }

  def total(date=Date.today)
    initial_amount + checkins.of(date).sum(:amount) - checkouts.of(date).sum(:amount)
  end

  def mpms
    c = []
    c << safe_div(initial_balance, initial_amount)
    checkins.by_date.each do |ci|
      counted = checkins.select { |c| c.date <= ci.date }
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

  private

  def safe_div(n1,n2)
    begin
      n1/n2
    rescue
      0
    end
  end

end
