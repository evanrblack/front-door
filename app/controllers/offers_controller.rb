class OffersController < ApplicationController  
  def index
    @listing = Listing.find(params[:listing_id])
    @offers = @listing.offers.order(:created_at).reverse
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @offer = @listing.offers.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @offer = @listing.offers.new(offer_params)
    if @offer.save
      flash.notice = 'Successfully added offer.'
      redirect_to listing_offers_path(@listing)
    else
      flash.alert = 'There were some errors with your submission.'
      render :new
    end
  end

  def update
    @offer = Offer.find(params[:id])
    @listing = @offer.listing
    if @offer.update(offer_params)
      flash.notice = 'Successfully updated offer.'
      redirect_to listing_offers_path(@listing)
    else
      flash.alert = 'There were some errors with your submission.'
      render :edit
    end
  end

  private

  def offer_params
    params.require(:offer).permit!
  end
end
