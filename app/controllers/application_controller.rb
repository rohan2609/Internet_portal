class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.class.name == 'AdminUser'
      '/admin'
    else
      customer_path(resource)
    end
  end


end
