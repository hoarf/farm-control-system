class Deal < ActiveRecord::Base
  belongs_to :partner
  has_one :inventory_change, :as => :changeable
  scope :buys, -> { where(deal_type: "Compra") }
  scope :sales, -> { where(deal_type: "Venda") }

  def total
    (males || 0)+(females || 0)
  end

end
