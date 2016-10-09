class Move < ActiveRecord::Base
  belongs_to :fact
  belongs_to :credit, class_name: "Account"
  belongs_to :debit, class_name: "Account"
  belongs_to :partner
end
