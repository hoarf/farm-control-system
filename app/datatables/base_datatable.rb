class BaseDatatable
  delegate :params, :h, :link_to, :number_to_currency,
           :number_with_precision, :l, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      data: data,
      recordsTotal: ready.count,
      recordsFiltered: scope.count,
    }
  end

  private

  def filter
    filter_params(scope)
  end

  def ready
    filter.order(sort_params).page(page).per(per_page)
  end

  def page
    params[:start].to_i/per_page
  end

  def search_params
    params.dig :search, :value
  end

  def sort_params
    "#{sort_col} #{sort_dir}"
  end

  def sort_col
    @columns[params.dig(:order, :'0', :column).to_i]
  end

  def sort_dir
    params.dig :order, :'0', :dir
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

end
