# This concern adds functionality for validating and
# normalizing phone numbers. It currently only uses
# the phone_number field.
module Phonable
  extend ActiveSupport::Concern

  included do
    class_attribute :phone_number_optional
    
    phony_normalize :phone_number, default_country_code: 'US'
    validates :phone_number, presence: true, unless: :phone_number_optional
    validates :phone_number, phony_plausible: true
  end

  def phone_number_formatted
    phone_number.phony_formatted
  end
end
