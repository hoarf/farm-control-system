# coding: utf-8

class FarmPresenter < BasePresenter

  attr_accessor :dre, :assets_balance

  def initialize(model, view)
    @dre = DrePresenter.new
    @assets_balance = AssetsBalancePresenter.new
    super
  end

  def profit(date=Date.today)
    @dre.profit(date)/@assets_balance.capital(date)
  end

  def indicators
    {
      labels: BaseIndicator.date_range,
      datasets: [ Selic.new.to_json, INPC.new.to_json ]
    }
  end

  def inventory
    range = BaseIndicator.date_range << Date.tomorrow
    m = MaleInventoryIndicator.new.to_json(range)
    f = FemaleInventoryIndicator.new.to_json(range)
    {
      labels: range,
      datasets: [
        f,
        m,
        {
          label: "Total",
          backgroundColor: 'rgba(0,255,0,.2)',
          data: [f[:data],m[:data]].transpose.map { |x| x.reduce(:+) }
        }
      ]
    }
  end

  def stack_options
    {
      title: {
        display: true,
        text: "Estoque",
      }
    }
   end

end
