# This class represents a home being sold.
class Listing < ApplicationRecord
  include Locatable

  belongs_to :client
  belongs_to :agent

  enum property_type: %i(residential condo commercial other)

  validates :client, :property_type, :bedrooms, :full_bathrooms,
            :half_bathrooms, :square_feet, :year_built, :asking_price,
            presence: true
  validates :property_type, inclusion: { in: property_types.keys }
  validates :bedrooms, :full_bathrooms, :half_bathrooms, :square_feet,
            :year_built, :asking_price,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Emails
  after_create :send_email_new
  after_update :send_email_claimed, if: -> { agent_id && agent_id_changed? }


  private

  def send_email_new
    # Send welcome to client
    ListingMailer.new_listing_client(self).deliver_now
    # Send info to agents
    agents = Agent.near(self, 60)
    agents.each { |a| ListingMailer.new_listing_agent(self, a).deliver_now }
  end

  def send_email_claimed
    # Send notice to client
    ListingMailer.claimed_listing_client(self).deliver_now
    # Send confirmation to agent
    ListingMailer.claimed_listing_agent(self).deliver_now
  end
end
