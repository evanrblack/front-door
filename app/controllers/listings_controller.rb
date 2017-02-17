# This class handles all actions for listings.
class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
    location = URI.escape(@listing.address)
    api_key = 'AIzaSyABnH3LBP2_H7WBbflOYL2Lc45n4PFzdW0'
    @image_url = "https://maps.googleapis.com/maps/api/streetview?size=600x400&location=#{location}&key=#{api_key}"
  end
end
