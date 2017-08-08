class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]


def index
  @recipes = current_user.recipes.all

end

def show
  @recipe = current_user.recipes.find(params[:id])
  @ingredients = @recipe.ingredients.all
end

def new
  @recipe = Recipe.new
  5.times { @recipe.ingredients.build}
end

def create
  @recipe = current_user.recipes.create!(recipe_params)
  redirect_to recipe_path(@recipe)
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
