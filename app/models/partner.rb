class Partner < ActiveRecord::Base
  belongs_to :deals

  def to_s
    name
  end

end
