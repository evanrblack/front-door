# Preview all emails at http://localhost:3000/rails/mailers/listing_mailer
class ListingMailerPreview < ActionMailer::Preview
  def new_listing_client
    ListingMailer.new_listing_client(Listing.first)
  end

  def new_listing_agent
    ListingMailer.new_listing_agent(Agent.first, Listing.first)
  end
end
