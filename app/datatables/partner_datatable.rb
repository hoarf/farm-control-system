class PartnerDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  def sortable_columns
    @sortable_columns ||= %w(Partners.name Partners.contact)
  end

  def searchable_columns
    @searchable_columns ||= %w(Partners.name Partners.contact)
  end

  private

  def data
    records.map do |record|
      {
       '0' => record.name,
       '1' => record.contact,
       'DT_RowId' => record.id
      }
    end
  end

  def get_raw_records
    Partner.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
