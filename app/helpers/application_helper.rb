# coding: utf-8
module ApplicationHelper

  def fa_menu_item(href, title, icon)
    """
    <li>
      <a href='#{href}' data-turbolinks='false'>
        <i class='fa fa-#{icon}'>
          <span class='fa-title'>#{title}</span>
        </i>
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
        <i class='fa fa-#{icon}'>
          <span class='fa-title'>#{title}#{scope_string}</span>
        </i>
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

end
