# This class represents the login info tied to a specific user type.
class Login < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  belongs_to :loginable, polymorphic: true
  validates :loginable, presence: true
end
