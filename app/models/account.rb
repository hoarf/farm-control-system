class Account < ActiveRecord::Base

  has_many :moves

  def to_datatable
    {
     '0' => name,
     '1' => type,
     '2' => balance,
     'DT_RowId' => id,
    }
  end

end
