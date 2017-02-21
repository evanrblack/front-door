# This class will have access to CRUD almost any resource.
class Admin < ApplicationRecord
  include Loginable, Nameable, Phonable
end
