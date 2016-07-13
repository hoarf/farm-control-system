class Deal < ActiveRecord::Base
  belongs_to :partner
  has_one :inventory_change, :as => :changeable

end
