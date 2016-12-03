class CreditsDatatable < MovesDatatable

  def scope
    DatatableMove
      .where( account_id: params[:account_id] )
      .where( type: 'Credit' )
  end

  def data
    ready.map do |r|
      {
        '0' => r.date,
        '1' => number_to_currency(r.amount),
      }
    end
  end

end
