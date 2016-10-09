class Account < ActiveRecord::Base
  has_many :moves
end
