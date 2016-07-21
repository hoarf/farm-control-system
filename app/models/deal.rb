class Deal < ActiveRecord::Base
  belongs_to :partner

  has_one :inventory_change, as: :inventoryable
  has_one :balance_change, as: :balanceable

  scope :buys, -> { where(deal_type: "Compra") }
  scope :sales, -> { where(deal_type: "Venda") }

  delegate :males, :females, to: :inventory_change
  delegate :amount, to: :balance_change

  validates_associated :balance_change, :inventory_change

  def total
    (males || 0)+(females || 0)
  end

end
