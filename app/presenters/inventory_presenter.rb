class InventoryPresenter < BasePresenter

  def mpm
    h.number_to_currency(super(Date.today))
  end

end
