# This model represents an offer on a property.
class Offer < ApplicationRecord
  belongs_to :listing

  enum direction: %i(dir_from dir_to)
  enum status: %i(offered contracted sold)

  after_create :send_email_offered
  after_update :send_email_contracted,
               if: -> { status == 'contracted' && status_changed? }
  after_update :send_email_sold,
               if: -> { status == 'sold' && status_changed? }

  validates :listing, :price, :direction, :status, :buyer_name, presence: true
  validates :direction, inclusion: { in: directions.keys }
  validates :status, inclusion: { in: statuses.keys }
  validates :price, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  delegate :agent, to: :listing
  delegate :client, to: :listing

  def dir
    direction.sub('dir_', '')
  end

  private

  def send_email_offered
    # Not necessary for agent, they're doing it themselves
    # EventMailer.offer_offered_agent(self)
    EventMailer.offer_offered_client(self).deliver_now
  end

  def send_email_contracted
    # Same, unless we wanted to do confirmation
    # EventMailer.offer_contracted_agent(self)
    EventMailer.offer_contracted_client(self).deliver_now
  end

  def send_email_sold
    EventMailer.offer_sold_agent(self).deliver_now
    EventMailer.offer_sold_client(self).deliver_now
  end
end
