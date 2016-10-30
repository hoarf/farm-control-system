# coding: utf-8
module ApplicationHelper

  def present(model, presenter_class=nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    yield(presenter) if block_given?
  end

  def number_with_precision(number)
    super(number, precision: 2)
  end

  def icon
    "fa fa-user"
  end

  def table
    "table text-center table-stripped table-bordered table-hover"
  end

  def table_id
    "#{request.parameters['controller']}-table"
  end

  def fa_menu_item(href, title, icon)
    """
    <li>
      <a href='#{href}' data-turbolinks='false'>
        <i class='fa fa-#{icon}'></i>
        <span class='fa-title'>#{title}</span>
      </a>
    </li>
    """.html_safe
  end

  def title(page_title, scope=nil)
    content_for(:title) { page_title }
  end

  def heading(text)
    content_for(:heading) { text }
  end

  def apagar_path(url)
    content_for(:apagar_path) {
      link_to "Apagar",
              url,
              method: :delete,
              data: { confirm: 'Tem certeza?' }
    }
  end


  def fa_alert_map(type)
    map = {
      error: "alert-danger",
      notice: "alert-success",
      alert: "alert-warning"
    }
    map[type]
  end

  def link_to(*args, &block)
    if (i = args.index { |arg| arg.class == Hash && arg.key?(:class) })
      args[i][:class] = (args[i][:class].split(' ') << 'btn').join(' ')
    elsif (i = args.index { |arg| arg.class == Hash })
      args[i].merge!({:class => 'btn'})
    else
      args << {:class => 'btn'}
    end
    super
  end

end
