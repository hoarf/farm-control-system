class DebitsDatatable < MovesDatatable

  def scope
    Debit.where({account_id: params[:account_id]})
  end

end
