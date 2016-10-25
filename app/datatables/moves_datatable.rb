class MovesDatatable < BaseDatatable

  def initialize(view)
    @columns = [:date, :amount]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => r.date,
        '1' => r.amount,
        'DT_RowId' => r.fact_id
      }
    end
  end

  def scope
    Move.where(fact_id: params[:fact_id])
  end

  def search
    ""
  end

end
