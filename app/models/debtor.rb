class Debtor < Account

  def checkout(date)
    - start - credits.of(date).sum(:amount) + debits.of(date).sum(:amount)
  end

end
