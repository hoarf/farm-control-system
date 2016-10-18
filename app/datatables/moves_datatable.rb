class MovesDatatable < BaseDatatable

  def initialize(view)
    @columns = [:credit_name, :debit_name, :amount]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => r.credit_name,
        '1' => r.debit_name,
        '2' => r.amount,
        'DT_RowId' => Fact.includes(:moves).
                        find_by(moves: { id: r.id }).id
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
