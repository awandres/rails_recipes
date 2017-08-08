class RecipesController < ApplicationController
def index
  @recipes = Recipe.all
end

def show
  @recipe = Recipe.find(params[:id])
  @ingredients = @recipe.ingredients.all
end

def new
  @recipe = Recipe.new
  5.times { @recipe.ingredients.build}
end

def create
  @recipe = Recipe.create!(recipe_params)
  redirect_to recipes_path
end

def edit
  @recipe = Recipe.find(params[:id])
end

def update
  @recipe = Recipe.find(params[:id])
  @recipe.update(recipe_params)
  redirect_to @recipe
end

def destroy
  @recipe = Recipe.find(params[:id])
  @recipe.destroy

  redirect_to recipes_path
end

private

def recipe_params
  params.require(:recipe).permit(:name, :cooktime, :img_url, ingredients_attributes: [:name, :_destroy])
end


end
