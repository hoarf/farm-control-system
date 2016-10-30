class DrePresenter < BasePresenter

  def method_missing(method_sym, *arguments, &block)
    if @model.respond_to?(method_sym)
      h.number_to_currency(@model.send(method_sym))
    else
      super
    end
  end

end
