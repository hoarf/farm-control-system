class Entry < ActiveRecord::Base

  belongs_to :inventory
  belongs_to :move

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
  validates_presence_of :type, :amount, :inventory_id

  delegate :date, to: :move, allow_nil: true


  def total
    Fact.includes(moves: [:entry]).
      where('facts.date <= ?', date).sum("entries.amount")
  end

  def mpm
    total/amount
  end

end
