class PartnerDatatable < BaseDatatable

private

  def my_search
    Partner.all
  end

  def sort_column
    '("name", "contact")'
  end

  def search_column
    "partners.name"
  end

end
