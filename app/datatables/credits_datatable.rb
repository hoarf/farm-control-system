class CreditsDatatable < MovesDatatable

  def scope
    Move.where({credit_id: params[:credit_id]})
  end

end
