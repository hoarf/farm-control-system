class Partner < ActiveRecord::Base

  validates_presence_of :name

  belongs_to :farm

  def to_s
    name
  end

end
