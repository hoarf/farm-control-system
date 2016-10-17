class Fact < ActiveRecord::Base

  has_many :moves, dependent: :destroy

  accepts_nested_attributes_for :moves, allow_destroy: true

  validates_presence_of :moves

  attr_reader :moves_amounts, :moves_debit_names, :moves_credit_names

  def moves_amounts
    moves.amounts
  end

  def moves_debit_names
    moves.debit_names
  end

  def moves_credit_names
    moves.credit_names
  end

end
