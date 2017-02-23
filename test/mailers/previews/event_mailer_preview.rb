# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview
  def listing_created_agent
    EventMailer.listing_created_agent(Listing.first, Agent.first)
  end

  def listing_created_client
    EventMailer.listing_created_client(Listing.first)
  end

  def listing_claimed_agent
    EventMailer.listing_claimed_agent(Listing.first)
  end

  def listing_claimed_client
    EventMailer.listing_claimed_client(Listing.first)
  end

  def listing_listed_agent
    EventMailer.listing_listed_agent(Listing.first)
  end

  def listing_listed_client
    EventMailer.listing_listed_client(Listing.first)
  end

  def offer_offered_client
    EventMailer.offer_offered_client(Offer.first)
  end

  def offer_contracted_client
    EventMailer.offer_contracted_client(Offer.first)
  end

  def offer_sold_agent
    EventMailer.offer_sold_agent(Offer.first)
  end

  def offer_sold_client
    EventMailer.offer_sold_client(Offer.first)
  end
end
