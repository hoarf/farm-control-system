class AccountPresenter < BasePresenter

  def parent
    @model.parent.name unless @model.parent.nil?
  end

  def balance
    h.number_to_currency(@model.balance)
  end

end
