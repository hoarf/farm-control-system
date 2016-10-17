class FactsDatatable < BaseDatatable

  def initialize(view)
    @columns = [:date, :description, :moves_debit_names, :moves_credit_names, :moves_amounts]
    super
  end

  private

  def scope
    Fact.all
  end

  def data
    ready.map do |r|
    {
     '0' => r.date,
     '1' => r.description,
     '2' => r.moves_debit_names,
     '3' => r.moves_credit_names,
     '4' => r.moves_amounts,
     'DT_RowId' => r.id,
    }
    end
  end

  def search
    "(lower(facts.description) like :search or to_char(facts.date,'YYYY-MM-DD') like :search)"
  end


end
