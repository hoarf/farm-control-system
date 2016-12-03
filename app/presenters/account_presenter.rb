# coding: utf-8
class AccountPresenter < BasePresenter

  def parent
     if @model.parent.nil? then "¯\\_(ツ)_/¯" else @model.parent.name end
  end

  def balance
    h.number_to_currency(@model.balance)
  end

end
