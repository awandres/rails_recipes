class Day < ApplicationRecord
  has_many :schedules
  has_many :recipes, through: :schedules
  
end
