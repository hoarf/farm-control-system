class Creditor < Account

  def balance
    start + credits.sum(:amount) - debits.sum(:amount)
  end

  def to_s
    name
  end

end
