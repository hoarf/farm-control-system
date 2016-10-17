class BaseDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      data: data,
      recordsTotal: scope.count,
      recordsFiltered: query.count
    }
  end

  private

  def paginate
    yield query.page(page).per(per_page)
  end

  def ready
    paginate do |query|
      if params['order']
        s = query.sort_by { |x| x[@columns[params['order']['0']['column'].to_i]] || "" }
        dir_param = params['order']['0']['dir'] || ""
        dir = dir_param == "desc" ? "desc" : nil
        s.reverse! if dir
        query = s
      end
      query
    end
  end

  def query
    records = scope
    if params[:search].present? && params[:search][:value].present?
      records = records.where("#{search}", search: "%#{params[:search][:value]}%")
    end
    records
  end

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

end
