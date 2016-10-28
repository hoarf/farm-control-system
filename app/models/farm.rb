class Farm < ActiveRecord::Base

  has_and_belongs_to_many :users

  has_many :accounts

  def profit_at(date)
    accounts.find_by(system_name: :profit).balance(date)
  end

end
