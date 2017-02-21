# This class represents the realtor.
class Agent < ApplicationRecord
  include Locatable, Loginable, Nameable, Phonable

  has_many :listings
  has_many :clients, through: :listings

  validates :license_number, presence: true
end
