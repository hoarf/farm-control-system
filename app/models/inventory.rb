class Inventory < ActiveRecord::Base

  has_many :entries, dependent: :delete_all
  has_many :checkins, class_name: Checkin.name
  has_many :checkouts, class_name: Checkout.name

  accepts_nested_attributes_for :entries, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :item, :date, :initial_amount, :initial_balance

  def total
    initial_amount + checkins.sum(:amount) - checkouts.sum(:amount)
  end

  def mpms
    c = []
    c << initial_balance/initial_amount
    sorted_entries = entries.sort_by(&:date)
    checkins.each do |ci|
      e = entries.eager_load(move: [:fact]).where("facts.date <= ?", ci.date)
      c << e.to_a.sum(&:total)/e.sum(:amount)
    end
    c
  end

  def balance
    initial_balance + checkins.to_a.sum(&:total) - checkouts.to_a.sum(&:total)
  end

end
