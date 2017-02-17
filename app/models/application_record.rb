# This class is inherited from by all database-backed models.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
