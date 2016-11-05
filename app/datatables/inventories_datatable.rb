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
        '0' => r["item"],
        '1' => "#{number_with_precision(r['total'].to_f)} #{r['unit']}",
        'DT_RowId' => r["id"],
      }
    end
  end

  def scope
    inventories = Inventory.arel_table
    entries = Entry.arel_table
    checkins = Checkin
                 .select(entries[:amount].sum.as("total"), entries[:inventory_id])
                 .group(:inventory_id).as("checkins")
    inventories
      .project(inventories[:id], inventories[:item], inventories[:unit], checkins[:total])
      .join(checkins, Arel::Nodes::OuterJoin)
      .on(checkins[:inventory_id].eq(inventories[:id]))
  end

  def filter_params(base)
    base.where(Inventory[:item].matches("%#{search_params}%"))
  end

end
