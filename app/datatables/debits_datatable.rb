class DebitsDatatable < MovesDatatable

  def scope
    DatatableMove
      .where( account_id: params[:account_id] )
      .where( type: 'Debit' )
  end

end
