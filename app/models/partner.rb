class Partner < ActiveRecord::Base
  include ArelHelpers::ArelTable

  scope :sorted, -> { order(:name) }

  validates_presence_of :name

  belongs_to :farm

  def to_s
    name
  end

end
