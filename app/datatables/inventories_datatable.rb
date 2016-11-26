class InventoriesDatatable < BaseDatatable

  def initialize(view)
    @columns = [:item, :total]
    super
  end

  private

  def data
    puts ready.each { |a| puts a }
    ready.map do |r|
      {
        '0' => r.item,
        '1' => r.total,
        'DT_RowId' => r.id,
      }
    end
  end

  def scope
    DatatableInventory.all
  end

  def filter_params(base)
    base.where(DatatableInventory[:item].matches("%#{search_params}%"))
  end

end
