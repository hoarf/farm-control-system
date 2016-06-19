class Other < ActiveRecord::Base
  has_one :inventory_change, :as => :changeable
end
