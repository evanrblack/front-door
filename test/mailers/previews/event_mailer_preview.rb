# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview
  def listing_created_client
    FrontDoorMailer.listing_created_client(FrontDoor.first)
  end

  def listing_created_agent
    FrontDoorMailer.listing_created_agent(Listing.first, Agent.first)
  end

  def listing_claimed_client
    listing = FrontDoor.first
    listing.agent = Agent.first
    FrontDoorMailer.listing_claimed_client(listing)
  end

  def listing_claimed_agent
    listing = FrontDoor.first
    listing.agent = Agent.first
    FrontDoorMailer.listing_claimed_agent(listing)
  end
end
