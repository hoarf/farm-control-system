class MovesDatatable < BaseDatatable

  def initialize(view)
    @columns = [:date, :amount]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => r.date && l(r.date, format: :short),
        '1' => number_to_currency(r.amount),
        'DT_RowId' => r.id
      }
    end
  end

  def scope
    Move.all
  end

  def filter_params(base)
    base
  end

end
