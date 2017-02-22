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

  # If one or other is found, both are required
  validates :mls_number, :mls_association,
            presence: true, if: -> { mls_number || mls_association }

  before_update :set_mls_at, if: -> { mls_number && mls_association }

  # Emails
  after_create :send_email_created
  after_update :send_email_claimed, if: -> { agent_id && agent_id_changed? }
  after_update :send_email_listed, if: :mls_at

  def status
  end

  private

  def set_mls_at
    self.mls_at = Time.zone.now
  end

  def send_email_created
    # Send welcome to client
    EventMailer.listing_created_client(self).deliver_now
    # Send info to agents
    agents = Agent.near(self, 60)
    agents.each { |a| EventMailer.listing_created_agent(self, a).deliver_now }
  end

  def send_email_claimed
    # Send notice to client
    EventMailer.listing_claimed_client(self).deliver_now
    # Send confirmation to agent
    EventMailer.listing_claimed_agent(self).deliver_now
  end

  def send_email_listed
    # Send notice to client
    EventMailer.listing_listed_client(self).deliver_now
    # Send confirmation to agent
    EventMailer.listing_listed_agent(self).deliver_now
  end
end
