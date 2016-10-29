class MovesDatatable < BaseDatatable

  def initialize(view)
    @columns = [:account, :type, :amount]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => r.account.name,
        '1' => r.model_name.human,
        '2' => number_to_currency(r.amount),
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
