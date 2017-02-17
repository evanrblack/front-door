# This is the parent class of Admin, Agent, and Client.
class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  phony_normalize :phone_number, default_country_code: 'US'

  validates :first_name, :last_name, presence: true
  validates :phone_number, presence: true, phony_plausible: true

  def phone_number_formatted
    phone_number.phony_formatted
  end
end
