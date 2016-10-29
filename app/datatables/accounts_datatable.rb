class AccountsDatatable < BaseDatatable

  def initialize(view)
    @columns = [:name, :description, :type, :balance]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => r.name,
        '1' => r.description,
        '2' => r.model_name.human,
        '3' => number_to_currency(r.balance),
        'DT_RowId' => r.id,
      }
    end
  end

  def scope
    Account.all
  end

  def search
    "lower(accounts.name) like :search or lower(accounts.type) like :search or lower(accounts.description) like :search"
  end

end
