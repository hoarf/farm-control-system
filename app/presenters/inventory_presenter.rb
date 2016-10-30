class InventoryPresenter < BasePresenter

  def mpm
    h.number_to_currency(super.nan? ? 0 : super)
  end

  def balance
    h.number_to_currency(super)
  end

end
