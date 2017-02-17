# This class is inherited from by all controllers.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
