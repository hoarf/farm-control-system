class Debtor < Account

  def checkout(date)
    credits.of_date(date) + debits.of_date(date)
  end

end
