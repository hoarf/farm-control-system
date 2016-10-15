class Partner < ActiveRecord::Base
  belongs_to :deals

  def to_s
    name
  end

  def to_datatable
    { '0' => name, '1' => contact, 'DT_RowId' => id }
  end
end
