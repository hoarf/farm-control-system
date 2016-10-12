class PartnerDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      data: data,
      recordsTotal: my_search.count,
      recordsFiltered: sort_order_filter.count
    }
  end

private

  def data
    partners = []
    display_on_page.map do |record|
      partner = []
      partner << record.name
      partner << record.contact
      partners << partner
    end
    partners
  end

  def my_search
    @filtered_partners = Partner.all
  end

  def sort_order_filter
    records = my_search.order("#{sort_column} #{sort_direction}")
    if params[:search][:value].present?
      records = records.where("PARTNERS.NAME like :search", search: "%#{params[:search][:value]}%")
    end
    records
  end

  def display_on_page
    sort_order_filter.page(page).per(per_page)
  end

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  def sort_column
    '("name", "contact")'
  end

  def sort_direction
    params[:order][:'0'][:dir] == "desc" ? "desc" : "asc"
  end

end
