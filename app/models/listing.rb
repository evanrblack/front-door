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
end
