class AccountsDatatable < BaseDatatable

  def initialize(view)
    @columns = [:name, :description, :valor]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => r.name,
        '1' => r.description,
        '2' => number_to_currency(r.valor),
        'DT_RowId' => r.id,
      }
    end
  end

  def scope
    DatatableAccount.all
  end

  def filter_params(base)
    base.where(DatatableAccount[:name].matches("%#{search_params}%").or(DatatableAccount[:description].matches("%#{search_params}%")))
  end

end
