# This class represents a buyer or seller.
class Client < User
  has_many :listings, dependent: :destroy
end
