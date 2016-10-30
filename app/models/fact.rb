# coding: utf-8

class Fact < ActiveRecord::Base

  MOVES_COUNT_MIN = 2

  has_many :moves, dependent: :destroy, inverse_of: :fact
  has_many :credits, dependent: :destroy
  has_many :debits, dependent: :destroy

  has_one :entry, dependent: :destroy

  belongs_to :partner

  accepts_nested_attributes_for :moves, allow_destroy: true
  accepts_nested_attributes_for :entry, allow_destroy: true

  validate :at_least_two_moves, :credits_and_debits_must_be_equal,

  def credits_and_debits_must_be_equal
    unless moves.reject(&:marked_for_destruction?)
             .select { |m| m.valid? }
             .map { |m| m.type == "Debit" ? m.amount : - m.amount }.reduce(:+) == 0
      errors.add(:moves, "A soma dos créditos e débitos deve ser igual")
    end
  end

  def at_least_two_moves
    unless moves.reject(&:marked_for_destruction?).count >= MOVES_COUNT_MIN
      errors.add(:moves, "No mínimo duas movimentações financeiras são necessárias")
    end
  end

  def debits_names
    debits.names
  end

  def credits_names
    credits.names
  end

  def cts_total
    begin
      moves.select { |m| m.account.system_name = :cost_to_sell }.first.amount
    rescue
      0
    end
  end

  def moves_amounts
    moves.totals/moves.count
  end

end
