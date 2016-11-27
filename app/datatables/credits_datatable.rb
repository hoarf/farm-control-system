class CreditsDatatable < MovesDatatable

  def scope
    DatatableMove
      .where( account_id: params[:account_id] )
      .where( type: 'Credit' )
  end

end
