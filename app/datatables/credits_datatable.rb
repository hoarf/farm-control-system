class CreditsDatatable < MovesDatatable

  def scope
    Credit.where({account_id: params[:account_id]})
  end

end
