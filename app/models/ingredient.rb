class Ingredient < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :recipes, through: :lists
end
