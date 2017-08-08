class Recipe < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :ingredients, through: :lists, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: :true
  belongs_to :user
end
