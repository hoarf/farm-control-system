class Creditor < Account

  def checkout
    start + credits.sum(:amount) - debits.sum(:amount)
  end

end
