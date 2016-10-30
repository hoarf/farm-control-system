class Account < ActiveRecord::Base

  PARENT_RIGHT_JOIN = "RIGHT OUTER JOIN accounts parents
                   on parents.id = accounts.parent_id"

  PARENT_LEFT_JOIN = "LEFT OUTER JOIN accounts parents
                   on parents.id = accounts.parent_id"

  PARENT_OR_CHILD_NAME = "accounts.system_name = :name OR
                           parents.system_name = :name"

  scope :parentables, -> { where(parent_id: nil) }
  scope :with_parent, -> { joins(PARENT_LEFT_JOIN) }
  scope :names, -> { pluck(:name) }
  scope :of_sysname, -> (name) { with_parent.where(PARENT_OR_CHILD_NAME, { name: name} ) }
  scope :system_names, -> { pluck(:system_name) }

  scope :of, -> (date) {
    joins(moves: [:fact])
      .where('facts.date between ? and ?', date - 1.year, date)
  }

  scope :movables, -> {
    joins(PARENT_RIGHT_JOIN)
      .where('accounts.parent_id is ?', nil)
      .pluck('parents.name, parents.id').sort_by { |i| i.first }
  }

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
