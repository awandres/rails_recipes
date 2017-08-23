class RecipesController < ApplicationController
  # my_recipes depends on current_user, and should be included here as well
  before_action :authenticate_user!, only: [ :new, :create, :edit, :my_recipes, :update, :destroy ]

  # Indentation

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
    @recipe = current_user.recipes.create!(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def my_recipes
    @recipes = current_user.recipes.all
  end

  # This method allowed updating a recipe that may not belong to the current_user
  def update
    @recipe = Recipe.find(params[:id])
    if(@recipe.user == current_user)
      @recipe.update(recipe_params)
    else
      flash[:alert] = "Can't update recipe that belongs to another user"
    end
    redirect_to @recipe
  end

  # This method allowed destroying a recipe that may not belong to the current_user
  def destroy
    @recipe = Recipe.find(params[:id])
    if(@recipe.user == current_user)
      @recipe.destroy
    else
      flash[:alert] = "Can't destroy recipe that belongs to another user"
    end
    redirect_to recipes_path
  end

private

  def recipe_params
    params.require(:recipe).permit(:name, :cooktime, :img_url, ingredients_attributes: [:name, :_destroy])
  end

end
