class MovesDatatable < BaseDatatable

  def initialize(view)
    @columns = [:date, :amount, :type]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => r.date && l(r.date, format: :short),
        '1' => number_to_currency(r.amount),
        '2' => r.type,
        '3' => r.account.name,
      }
    end
  end

  def scope
    Move.joins(:fact)
  end

  def filter_params(base)
    base
  end

end
