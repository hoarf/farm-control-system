class Account < ActiveRecord::Base

  MOVABLES_SCOPE = "RIGHT OUTER JOIN accounts parents
                   on parents.id = accounts.parent_id"

  scope :movables, -> {
    joins(MOVABLES_SCOPE)
      .where('accounts.parent_id is ?', nil)
      .pluck('parents.name, parents.id')
  }

  scope :parentables, -> { where(parent_id: nil) }
  scope :names, -> { pluck(:name) }

  has_many :debits
  has_many :credits
  has_many :moves
  has_many :children, class_name: Account.name,
           foreign_key: :parent_id, inverse_of: :parent

  belongs_to :farm
  belongs_to :parent, class_name: Account.name,
             inverse_of: :children

  validates_presence_of :type, :name, :start

  def balance
    if children.count > 0
      children.to_a.sum(&:checkout)
    else
      checkout
    end
  end

end
