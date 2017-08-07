class Recipe < ApplicationRecord
  has_many :lists
  has_many :ingredients, through: :lists
end
