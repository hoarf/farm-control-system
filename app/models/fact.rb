# coding: utf-8
class Fact < ActiveRecord::Base
  MOVES_COUNT_MIN = 2

  has_many :moves, dependent: :destroy
  has_many :credits
  has_many :debits

  has_one :entry, dependent: :destroy
  belongs_to :partner

  accepts_nested_attributes_for :moves, allow_destroy: true
  accepts_nested_attributes_for :entry, allow_destroy: true

  validate :credits_and_debits_must_be_equal, :at_least_two_moves

  def credits_and_debits_must_be_equal
    unless moves.reject(&:marked_for_destruction?).map { |m| m.type == "Debit" ? m.amount : -m.amount }.reduce(:+) == 0
      errors.add(:moves, "A soma dos créditos e débitos deve ser igual")
    end
  end

  def at_least_two_moves
    unless moves.reject(&:marked_for_destruction?).count >= MOVES_COUNT_MIN
      errors.add(:moves, "No mínimo duas movimentações financeiras são necessárias")
    end
  end

  def total_debits
    debits.sum(:amount)
  end

  def debits_names
    debits.collect { |d| d.account_name }
  end

  def credits_names
    credits.collect { |d| d.account_name }
  end

  def moves_amounts
    moves.pluck(:amount)
  end

end
