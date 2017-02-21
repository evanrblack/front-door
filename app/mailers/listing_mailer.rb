class ListingMailer < ApplicationMailer
  def new_listing_client(listing)
    @listing = listing
    @client = @listing.client
    mail(to: @client.email, subject: "Thank You for Listing with Front Door")
  end

  def new_listing_agent(agent, listing)
    @agent = agent
    @listing = listing
    @client = @listing.client
    mail(to: @agent.email, subject: "New Listing: #{@listing.street_address}")
  end
end
