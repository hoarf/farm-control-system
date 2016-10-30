class Account < ActiveRecord::Base

  MOVABLES_SCOPE = "RIGHT OUTER JOIN accounts parents
                   on parents.id = accounts.parent_id"

  scope :movables, -> {
    joins(MOVABLES_SCOPE)
      .where('accounts.parent_id is ?', nil)
      .pluck('parents.name, parents.id').sort_by { |i| i.first }
  }

  scope :sorted, -> { order(:name) }
  scope :parentables, -> { where(parent_id: nil) }
  scope :names, -> { pluck(:name) }
  scope :of, -> (date) {
    joins(moves: [:fact])
      .where('facts.date between ? and ?', date - 1.year, date)
  }

  scope :of_system_name, -> (name) {
    where(system_name: name)
  }

  scope :system_names, -> { pluck(:system_name) }

  has_many :debits
  has_many :credits
  has_many :moves
  has_many :children, class_name: Account.name,
           foreign_key: :parent_id, inverse_of: :parent

  belongs_to :farm
  belongs_to :parent, class_name: Account.name,
             inverse_of: :children

  validates_presence_of :type, :name, :start

  def self.with_balance(scope)
    scope.to_a.map { |a| a.balance }.reduce(0, :+)
  end

  def balance(date=Date.today)
    if children.count > 0
      children.to_a.map { |x| x.checkout(date) }.reduce(:+)
    else
      checkout(date)
    end
  end

end
