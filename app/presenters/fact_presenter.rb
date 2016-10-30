class FactPresenter < BasePresenter

  def date
    h.l(super, format: :long)
  end

end
