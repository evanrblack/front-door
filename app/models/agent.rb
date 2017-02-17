# This class represents the realtor.
class Agent < User
  has_many :listings
  has_many :clients, through: :listings
end
