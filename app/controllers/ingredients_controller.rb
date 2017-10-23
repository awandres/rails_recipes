class IngredientsController < ApplicationController

  # indentation
  def shopping_list
    @recipes = current_user.recipes.all
  end

end
