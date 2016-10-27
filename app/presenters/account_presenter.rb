class AccountPresenter < BasePresenter

  def parent
    @model.parent.name unless @model.parent.nil?
  end

end
