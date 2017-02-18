# This class is inherited from by all controllers.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to root_path,
                  alert: 'You are not authorized to access the requested page.'
    else
      redirect_to new_user_session_path,
                  alert: 'You must log in to access the requested page.'
    end
  end
end
