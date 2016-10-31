class Partner < ActiveRecord::Base

  scope :sorted, -> { order(:name) }

  validates_presence_of :name

  belongs_to :farm

  def to_s
    name
  end

end
