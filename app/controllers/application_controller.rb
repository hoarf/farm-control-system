class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :farmize_user!
  layout :resolve_layout

  private

  def resolve_layout

    return 'devise' if action_name == 'farmyourself'
    return 'devise' if controller_name == 'devise'
    return 'devise' if controller_name == 'sessions'
    return 'devise' if controller_name == 'registration'


    return 'application' if controller_name == 'farms'
    return 'index' if action_name == 'index'
    return 'show' if action_name == 'show'
    return 'new' if action_name == 'new'
    return 'edit' if action_name == 'edit'

    return 'application'
  end

  def farmize_user!
    puts action_name
    puts controller_name
    puts user_signed_in?
    redirect_to getafarm_path if (user_signed_in? and current_user.farm.nil?) or (not user_signed_in? and action_name == 'farmyourself')
  end

end
