class AccountsDatatable < BaseDatatable

  def initialize(view)
    @columns = [:name, :type, :balance]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => r.name,
        '1' => r.model_name.human,
        '2' => r.balance,
        'DT_RowId' => r.id,
      }
    end
  end

  def scope
    Account.all
  end

  def search
    "lower(accounts.name) like :search or lower(accounts.type) like :search"
  end

end
