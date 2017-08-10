class IngredientsController < ApplicationController

def shopping_list
  @recipes = current_user.recipes.all
  
end

end
