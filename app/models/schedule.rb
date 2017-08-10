class Schedule < ApplicationRecord
  belongs_to :day
  belongs_to :recipe, optional: true
  belongs_to :user

end
