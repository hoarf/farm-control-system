class Inventory < ActiveRecord::Base

  has_many :entries, dependent: :delete_all
  accepts_nested_attributes_for :entries, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :item, :start_date, :start_amount, :start_value

  def total
    Checkin.where(inventory_id: id).sum(:amount) -
      Checkout.where(inventory_id: id).sum(:amount)
  end

  def balance
    Checkin.where(inventory_id: id).collect { |x| x.total_cost }.sum -
      Checkout.where(inventory_id: id).collect { |x| x.total_cost }.sum
  end

end
