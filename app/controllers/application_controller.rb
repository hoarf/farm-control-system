class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :redirect_if_farmless
  layout :resolve_layout

  private

  def resolve_layout
    return 'devise' if action_name == 'farmyourself'
    return 'devise' if controller_name == 'devise'
    return 'devise' if controller_name == 'sessions'
    return 'devise' if controller_name == 'registrations'
    return 'devise' if controller_name == 'passwords'
    return 'devise' if controller_name == 'confirmations'

    return 'application' if controller_name == 'farms'
    return 'index' if action_name == 'index'
    return 'show' if action_name == 'show'
    return 'new' if action_name == 'new'
    return 'edit' if action_name == 'edit'

    return 'application'
  end

  def redirect_if_farmless
    if user_signed_in?
      if current_user.farmless?
        if action_name != "farmyourself"
          if request.get?
            redirect_to getafarm_path
          end
        end
      end
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.farm.nil?
      getafarm_path
    else
      farm_path(current_user.farm)
    end
  end

end
