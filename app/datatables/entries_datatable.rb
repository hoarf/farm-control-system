class EntriesDatatable < BaseDatatable

  def initialize(view)
    @columns = [:date, :amount, :cost, :total, :type]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => l(r.date, format: :short),
        '1' => r.amount,
        '2' => r.model_name.human,
        'DT_RowId' => r.fact.id,
      }
    end
  end

  def scope
    Entry.joins(:fact).where(inventory_id: params[:inventory_id])
  end

  def filter_params(base)
    base
  end

end
