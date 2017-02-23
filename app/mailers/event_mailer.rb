class EventMailer < ApplicationMailer
  def listing_created_agent(listing, agent)
    @listing = listing
    @client = @listing.client
    @agent = agent
    mail(to: @agent.email, subject: "New listing: #{@listing.street_address}")
  end

  def listing_created_client(listing)
    @listing = listing
    @client = @listing.client
    mail(to: @client.email, subject: "Thank you for listing with Front Door")
  end

  def listing_claimed_agent(listing)
    @listing = listing
    @agent = @listing.agent
    @client = @listing.client
    mail(to: @agent.email,
         subject: "You agreed to represent #{@client.name}")
  end
  
  def listing_claimed_client(listing)
    @listing = listing
    @agent = @listing.agent
    @client = @listing.client
    mail(to: @client.email,
         subject: "#{@agent.name} agreed to be your agent")
  end

  def listing_listed_agent(listing)
    @listing = listing
    @agent = @listing.agent
    @client = @listing.client
    mail(to: @agent.email,
         subject: "You added #{@client.name}'s property to your MLS")
  end
  
  def listing_listed_client(listing)
    @listing = listing
    @agent = @listing.agent
    @client = @listing.client
    mail(to: @client.email,
         subject: "#{@agent.name} added your property to their MLS")
  end

  def offer_offered_client(offer)
    @offer = offer
    @listing = @offer.listing
    @agent = @listing.agent
    @client = @listing.client
    mail(to: @client.email,
         subject: "An offer was sent #{@offer.dir} #{@offer.buyer_name}")
  end

  def offer_contracted_client(offer)
    @offer = offer
    @listing = @offer.listing
    @agent = @listing.agent
    @client = @listing.client
    mail(to: @client.email,
         subject: 'Your property is now under contract')
  end

  def offer_sold_agent(offer)
    @offer = offer
    @listing = @offer.listing
    @agent = @listing.agent
    @client = @listing.client
    mail(to: @agent.email,
         subject: "Thank you for selling with Front Door")
  end
  
  def offer_sold_client(offer)
    @offer = offer
    @listing = @offer.listing
    @agent = @listing.agent
    @client = @listing.client
    mail(to: @client.email,
         subject: 'Thank you for selling with Front Door')
  end
end
