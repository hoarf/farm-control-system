class DebitsDatatable < MovesDatatable

  def scope
    Move.where({debit_id: params[:debit_id]})
  end

end
