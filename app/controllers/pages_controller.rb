# This controller is for non resource-backed pages.
class PagesController < ApplicationController
  def home; end

  def dashboard
    @user = current_user
    send("#{current_user.model_name.singular}_dashboard")
  end

  private

  def admin_dashboard
    render 'admin_dashboard'
  end

  def agent_dashboard
    render 'agent_dashboard'
  end
  
  def client_dashboard
    render 'client_dashboard'
  end
end
