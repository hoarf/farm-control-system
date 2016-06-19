class InvetoryChange < ActiveRecord::Base
  belongs_to :changeable, polymorphic: true
end
