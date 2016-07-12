module WelcomeHelper

  # Begin code necessary for devise to work outside of it's controller.

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # ------------------------------------------------------------------

end
