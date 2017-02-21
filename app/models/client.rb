# This class represents a buyer or seller.
class Client < ApplicationRecord
  include Loginable, Nameable, Phonable
  
  has_many :listings, dependent: :destroy
end
