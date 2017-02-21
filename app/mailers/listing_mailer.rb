class ListingMailer < ApplicationMailer
  def new_listing_client(listing)
    @listing = listing
    @client = @listing.client
    mail(to: @client.email, subject: "Thank you for listing with Front Door")
  end

  def new_listing_agent(listing, agent)
    @listing = listing
    @client = @listing.client
    @agent = agent
    mail(to: @agent.email, subject: "New listing: #{@listing.street_address}")
  end

  def claimed_listing_client(listing)
    @listing = listing
    @agent = @listing.agent
    @client = @listing.client
    mail(to: @client.email,
         subject: "#{@agent.name} has agreed to be your agent")
  end

  def claimed_listing_agent(listing)
    @listing = listing
    @agent = @listing.agent
    @client = @listing.client
    mail(to: @agent.email,
         subject: "You have agreed to represent #{@client.name}")
  end
end
