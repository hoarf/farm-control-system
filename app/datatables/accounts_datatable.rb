class AccountsDatatable < BaseDatatable

private

  def my_search
    Account.all
  end

  def sort_column
    '("name")'
  end

  def search_column
    "accounts.name"
  end

end
