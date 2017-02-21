# Preview all emails at http://localhost:3000/rails/mailers/listing_mailer
class ListingMailerPreview < ActionMailer::Preview
  def new_listing_client
    ListingMailer.new_listing_client(Listing.first)
  end

  def new_listing_agent
    ListingMailer.new_listing_agent(Listing.first, Agent.first)
  end

  def claimed_listing_client
    listing = Listing.first
    listing.agent = Agent.first
    ListingMailer.claimed_listing_client(listing)
  end

  def claimed_listing_agent
    listing = Listing.first
    listing.agent = Agent.first
    ListingMailer.claimed_listing_agent(listing)
  end
end
