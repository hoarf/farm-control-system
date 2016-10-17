class InventoriesDatatable < BaseDatatable

  def initialize(view)
    @columns = [:item, :total, :balance]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => r.item,
        '1' => r.total,
        '2' => r.balance,
        'DT_RowId' => r.id,
      }
    end
  end


  def scope
    Inventory.all
  end


  def search
    "lower(item) like :search"
  end

end
