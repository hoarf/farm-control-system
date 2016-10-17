class Move < ActiveRecord::Base

  belongs_to :fact, dependent: :destroy
  belongs_to :credit, class_name: "Account"
  belongs_to :debit, class_name: "Account"
  belongs_to :partner
  has_one :entry, dependent: :destroy

  accepts_nested_attributes_for :entry, allow_destroy: true

  delegate :name, to: :credit, prefix: true, allow_nil: true
  delegate :name, to: :debit, prefix: true, allow_nil: true

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
  validates_presence_of :credit_id, :debit_id, :amount

  def self.amounts
    self.pluck(:amount).join("<br>")
  end

  def self.debit_names
    self.eager_load(:debit).pluck('accounts.name').join("<br>")
  end

  def self.credit_names
    self.eager_load(:credit).pluck('accounts.name').join("<br>")
  end

end
