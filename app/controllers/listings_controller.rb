# This class handles all actions for listings.
class ListingsController < ApplicationController
  load_and_authorize_resource

  def show
    @listing = Listing.find(params[:id])
    location = URI.escape(@listing.address)
    api_key = 'AIzaSyABnH3LBP2_H7WBbflOYL2Lc45n4PFzdW0'
    @street_view_url = "https://maps.googleapis.com/maps/api/streetview?size=640x480&location=#{location}&key=#{api_key}"
    @map_view_url = "https://maps.googleapis.com/maps/api/staticmap?center=#{location}&zoom=16&size=300x300&key=#{api_key}"
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.client = current_user
    if @listing.save
      flash.notice = 'Successfully created listing.'
      redirect_to @listing
    else
      flash.alert = 'There were some errors in your submission.'
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      flash.notice = 'Successfully updated listing.'
      redirect_to @listing
    else
      flash.alert = 'There were some errors in your submission.'
      render :edit
    end
  end

  private

  def listing_params
    params.require(:listing).permit!
  end
end
