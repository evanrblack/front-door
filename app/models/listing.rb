class Listing < ApplicationRecord

  STATES = {
    'Alabama' => 'AL',
    'Alaska' => 'AK',
    'Arizona' => 'AZ',
    'Arkansas' => 'AR',
    'California' => 'CA',
    'Colorado' => 'CO',
    'Connecticut' => 'CT',
    'Delaware' => 'DE',
    'District of Columbia' => 'DC',
    'Florida' => 'FL',
    'Georgia' => 'GA',
    'Hawaii' => 'HI',
    'Idaho' => 'ID',
    'Illinois' => 'IL',
    'Indiana' => 'IN',
    'Iowa' => 'IA',
    'Kansas' => 'KS',
    'Kentucky' => 'KY',
    'Louisiana' => 'LA',
    'Maine' => 'ME',
    'Maryland' => 'MD',
    'Massachusetts' => 'MA',
    'Michigan' => 'MI',
    'Minnesota' => 'MN',
    'Mississippi' => 'MS',
    'Missouri' => 'MO',
    'Montana' => 'MT',
    'Nebraska' => 'NE',
    'Nevada' => 'NV',
    'New Hampshire' => 'NH',
    'New Jersey' => 'NJ',
    'New Mexico' => 'NM',
    'New York' => 'NY',
    'North Carolina' => 'NC',
    'North Dakota' => 'ND',
    'Ohio' => 'OH',
    'Oklahoma' => 'OK',
    'Oregon' => 'OR',
    'Pennsylvania' => 'PA',
    'Rhode Island' => 'RI',
    'South Carolina' => 'SC',
    'South Dakota' => 'SD',
    'Tennessee' => 'TN',
    'Texas' => 'TX',
    'Utah' => 'UT',
    'Vermont' => 'VT',
    'Virginia' => 'VA',
    'Washington' => 'WA',
    'West Virginia' => 'WV',
    'Wisconsin' => 'WI',
    'Wyoming' => 'WY'
  }.invert
  
  belongs_to :client
  belongs_to :agent
  
  validates :street_address, :city, presence: true
  validates :state, inclusion: { in: STATES.keys }
  validates :zip_code, format: { with: /\A[0-9]{5}\z/ }

  validates :bedrooms, :full_bathrooms, :half_bathrooms, :square_feet,
            :year_built, :asking_price,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  geocoded_by :address do |obj, results|
    next unless geo = results.first
    obj.city = geo.city unless geo.city.blank?
    obj.latitude = geo.latitude || 0.0
    obj.longitude = geo.longitude || 0.0
  end

  before_save :geocode, if: :address_changed?

  def address
    "#{street_address}, #{city}, #{state} #{zip_code}"
  end

  private

  # This method will save us from hitting Google each time.
  def address_changed?
    [:street_address, :city, :state, :zip_code]
      .map { |s| send("#{s}_changed?") }.include? true
  end
end
