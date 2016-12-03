class DebitsDatatable < MovesDatatable

  def scope
    DatatableMove
      .where( account_id: params[:account_id] )
      .where( type: 'Debit' )
  end

  def data
    ready.map do |r|
      {
        '0' => l(Date.parse(r.date), format: :short),
        '1' => number_to_currency(r.amount),
        '2' => r.type,
        '3' => r.account.name,
      }
    end
  end

end
