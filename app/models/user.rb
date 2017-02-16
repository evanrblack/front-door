class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  # Validations
  validates :first_name, :last_name, presence: true
  
  phony_normalize :phone_number, default_country_code: 'US'
  validates :phone_number, presence: true, phony_plausible: true
end
