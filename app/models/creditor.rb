class Creditor < Account

  def checkout(date)
    credits.of(date) - debits.of(date)
  end

end
