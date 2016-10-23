# coding: utf-8
class FemaleInventoryIndicator

  def initialize
    @females = Inventory.find_by(system_name: :females)
  end


  def to_json(interval)
    {
      label: 'Fêmeas',
      backgroundColor: 'rgba(255,0,0,.2)',
      data: interval.map { |d| @females.total(d) }
    }
  end


end
