class Ingredient < ApplicationRecord
  has_many :lists
  has_many :recipes, through: :lists
end
