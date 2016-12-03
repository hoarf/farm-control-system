class MovesDatatable < BaseDatatable

  def initialize(view)
    @columns = [:date, :amount, :type]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => number_to_currency(r.amount),
        '1' => r.model_name.human,
        '2' => r.account.name
      }
    end
  end

  def scope
    Move.joins(:fact).where(fact_id: params[:fact_id])
  end

  def filter_params(base)
    base
  end

end
