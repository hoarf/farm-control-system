class FactsDatatable < BaseDatatable

  def initialize(view)
    @columns = [:date, :description, :total, :partner]
    super
  end

  private

  def scope
    Fact.all
  end

  def data
    ready.map do |r|
    {
     '0' => l(r.date, format: :short),
     '1' => r.description,
     '2' => number_to_currency(r.total),
     '3' => r.partner,
     'DT_RowId' => r.id,
    }
    end
  end

  def scope
    DatatableFact.all
  end

  def filter_params(base)
    base.where(
      DatatableFact[:partner].matches("%#{search_params}%").or(
        DatatableFact[:description].matches("%#{search_params}%"))
    )
  end

end
