class Fact < ActiveRecord::Base

  has_many :moves, dependent: :delete_all

  accepts_nested_attributes_for :moves, reject_if: :all_blank, allow_destroy: true


end
