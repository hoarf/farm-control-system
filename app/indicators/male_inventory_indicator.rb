# coding: utf-8
class MaleInventoryIndicator

  def initialize
    @males = Inventory.find_by(system_name: :males)
  end

  def to_json(interval)
    {
      label: 'Machos',
      type: 'bar',
      backgroundColor: 'rgba(0,0,255,1)',
      data: interval.map { |d| @males.total(d) }
    }
  end

end
