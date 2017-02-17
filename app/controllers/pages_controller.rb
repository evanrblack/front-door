class PagesController < ApplicationController
  def home
  end

  def dashboard
    render "#{current_user.model_name.singular}_dashboard"
  end
end
