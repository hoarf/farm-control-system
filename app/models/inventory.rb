class Inventory < ActiveRecord::Base


  has_many :entries, dependent: :delete_all
  has_many :checkins
  has_many :checkouts

  belongs_to :farm

  accepts_nested_attributes_for :entries, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :item, :date, :initial_amount, :initial_balance

  def total(date=Date.today)
    initial_amount + checkins.of(date).sum(:amount) - checkouts.of(date).sum(:amount)
  end

  def mpms
    c = []
    c << initial_balance/initial_amount
    sorted_entries = entries.sort_by(&:date)
    checkins.each do |ci|
      e = entries.eager_load(:fact).where("facts.date <= ?", ci.date)
      c << e.to_a.sum(&:total)/e.sum(:amount)
    end
    c
  end

  def mpm
    mpms.last
  end

  def form_label
    "#{item} - (CTS: #{mpm})"
  end

  after_initialize do |i|
    i.date ||= Date.today if new_record?
  end

  def balance(date=Date.today)
    initial_balance + checkins.of(date).to_a.sum(&:total) - checkouts.of(date).to_a.sum(&:total)
  end

end
