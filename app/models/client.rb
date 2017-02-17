# This class represents a buyer or seller.
class Client < User
  has_one :listing, dependent: :destroy
end
