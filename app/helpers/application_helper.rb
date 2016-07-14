# coding: utf-8
module ApplicationHelper

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

  def fa_page_header(title, icon, scope=nil)
    scope_string = scope && " - (#{scope})"
    """
    <div class='row'>
      <div class='col-lg-12'>
      <h1 class='page-header'>
        <i class='fa fa-#{icon}'></i>
        <span class='fa-title'>#{title}#{scope_string}</span>
      </h1>
      </div>
    </div>
    """.html_safe
  end

  def fa_page_alert(notice)
    notice && """
    <div class='alert alert-info alert-dismissable'>
      <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>x</button>
      #{notice}
    </div>
    """.html_safe
  end

  def fa_no_resource(resource)
    """
    <div class='row'>
      <div class='col-lg-12'>
        <div class='panel panel-info'>
          <div class='panel-heading'>
            Nenhum #{resource} Encontrado
          </div>
          <div class='panel-body'>
            Não existe nenhum <em>#{resource}</em> cadastrado com os critérios especificados
          </div>
        </div>
      </div>
    </div>
    """.html_safe
  end

  def link_to(*args, &block)
    if (i = args.index { |arg| arg.class == Hash && arg.key?(:class) })
      args[i][:class] = (args[i][:class].split(' ') << 'btn btn-link').join(' ')
    elsif (i = args.index { |arg| arg.class == Hash })
      args[i].merge!({:class => 'btn btn-link'})
    else
      args << {:class => 'btn btn-link'}
    end
    super
  end

  def fa_delete_button(path)
    """
    <a class='btn btn-link' data-confirm='Tem certeza que deseja apagar?' rel='nofollow' data-method='delete' href='#{path}'>
      <button type='button' data-toggle='tooltip' data-original-title='Apagar' title data-placement='top' class='btn btn-circle btn-warning'>
        <i class='fa fa-trash-o'></i>
      </button>
    </a>
    """.html_safe
  end

  def fa_edit_button(path)
    """
    <a class='btn btn-link' rel='nofollow' href='#{path}'>
      <button type='button'  data-toggle='tooltip' data-original-title='Editar' title data-placement='top' class='btn btn-circle btn-info'>
        <i class='fa fa-edit'></i>
      </button>
    </a>
    """.html_safe
  end

  def fa_show_button(path)
    """
    <a class='btn btn-link' rel='nofollow' href='#{path}'>
      <button type='button'  data-toggle='tooltip' data-original-title='Detalhes' title data-placement='top' class='btn btn-circle btn-success'>
        <i class='fa fa-info'></i>
      </button>
    </a>
    """.html_safe
  end

  def fa_index_button(path)
    """
    <a class='btn btn-link' rel='nofollow' href='#{path}'>
      <button type='button'  data-toggle='tooltip' data-original-title='Listar' title data-placement='top' class='btn btn-circle btn-primary'>
        <i class='fa fa-list'></i>
      </button>
    </a>
    """.html_safe
  end
end
