class EntriesDatatable < BaseDatatable

  def initialize(view)
    @columns = [:date, :total, :amount, :mpm]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => r.date,
        '1' => r.total,
        '2' => r.amount,
        '3' => r.mpm,
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
