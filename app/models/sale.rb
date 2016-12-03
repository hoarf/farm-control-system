# coding: utf-8
class Sale
  include ActiveModel::Model

  validates_presence_of :amount_males, :amount_females, :amount

  validates :amount_males, numericality: { greater_than_or_equal_to: 0 }
  validates :amount_females, numericality: { greater_than_or_equal_to: 0 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  attr_accessor :amount_males, :amount_females, :amount, :date, :description, :evidence, :partner_id

  validate :create_facts

  def create_facts
    total = amount_males + amount_females
    Fact.create_from_sale(self, Inventory.males, amount_males, total)
    Fact.create_from_sale(self, Inventory.females, amount_females, total)
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      unless name =~ /date/
        send("#{name}=", value)
      end
    end
    send("amount_males=", attributes[:amount_females].to_i || 0)
    send("amount_females=", attributes[:amount_females].to_i || 0)
    send("amount=", attributes[:amount].to_f || 0.0)
    dt = flatten_date_array(attributes)
    send("date=", Date.new(*dt)) if dt.any? { |i| i != 0 }
  end

  def flatten_date_array(hash)
    %w(1 2 3).map { |e| hash["date(#{e}i)"].to_i }
  end

  def persisted?
    false
  end

end
