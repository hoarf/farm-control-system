class Debtor < Account

  def balance
    start - credits.sum(:amount) + debits.sum(:amount)
  end

end
