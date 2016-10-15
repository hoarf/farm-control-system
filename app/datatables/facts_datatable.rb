class FactsDatatable < BaseDatatable

private

  def my_search
    Fact.all
  end

  def data
    display_on_page.map do |r|
    {
     '0' => r.date,
     '1' => r.description,
     '2' => r.moves.first_or_initialize.debit_name,
     '3' => r.moves.first_or_initialize.credit_name,
     '4' => r.moves.first_or_initialize.amount,
     'DT_RowId' => r.id,
    }
    end
  end

  def sort_column
    columns = %w[date description not_orderable not_orderable not_orderable not_orderable]
    columns[params[:order][:'0'][:column].to_i] if params[:order] else "date"
  end

  def search_column
    "facts.description"
  end

end
