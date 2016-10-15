class Move < ActiveRecord::Base

  belongs_to :fact
  belongs_to :credit, class_name: "Account"
  belongs_to :debit, class_name: "Account"
  belongs_to :partner

  delegate :name, to: :credit, prefix: true, allow_nil: true
  delegate :name, to: :debit, prefix: true, allow_nil: true

end
