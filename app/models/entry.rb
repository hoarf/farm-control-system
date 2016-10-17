class Entry < ActiveRecord::Base

  belongs_to :inventory
  belongs_to :move

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
  validates_presence_of :type, :amount, :inventory_id

  def total_cost
    0
  end

  def cost_peps
    0
  end

  def cost_mpm
    0
  end

end
