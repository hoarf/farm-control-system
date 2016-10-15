class BaseDatatable
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

  def sort_order_filter
    records = my_search.order("#{sort_column} #{sort_direction}")
    if params[:search].present? && params[:search][:value].present?
      records = records.where("#{search_column} like :search", search: "%#{params[:search][:value]}%")
    end
    records
  end

  def display_on_page
    sort_order_filter.page(page).per(per_page)
  end

  def sort_direction
    params[:order] && params[:order][:'0'][:dir] == "desc" ? "desc" : "asc"
  end

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

end
