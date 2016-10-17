class PartnerDatatable < BaseDatatable

  def initialize(view)
    @columns = [:name, :contact]
    super
  end

  private

  def data
    ready.map do |r|
      {
        '0' => r.name,
        '1' => r.contact,
        'DT_RowId' => r.id
      }
    end
  end


  def scope
    Partner.all
  end


  def search
    "lower(partners.name) like :search or lower(contact) like :search"
  end

end
