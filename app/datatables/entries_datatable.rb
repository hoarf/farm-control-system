class EntriesDatatable < BaseDatatable

  def initialize(view)
    @columns = [:date, :amount, :cost, :total, :type]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => r.date,
        '1' => r.amount,
        '2' => r.cost,
        '3' => r.total,
        '4' => r.model_name.human,
        'DT_RowId' => r.id,
      }
    end
  end


  def scope
    Entry.where(inventory_id: params[:inventory_id])
  end


  def search
    ""
  end

end
