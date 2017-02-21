# This controller is for non resource-backed pages.
class PagesController < ApplicationController
  def home; end

  def dashboard
    @user = current_user
    send("#{@user.model_name.singular}_dashboard")
  end

  private

  def admin_dashboard
    render 'admin_dashboard'
  end

  def agent_dashboard
    @listings = @user.listings
    @unclaimed_listings = Listing.where(agent_id: nil).near(@user, 60)
    render 'agent_dashboard'
  end

  def client_dashboard
    @listings = @user.listings
    render 'client_dashboard'
  end
end
