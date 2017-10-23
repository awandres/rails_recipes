class SchedulesController < ApplicationController
  # Schedules only make sense in context of the current_user, should be protected by auth
  before_action :authenticate_user!, only: [ :index, :show, :destroy, :remove_recipe, :add_recipe, :choose_recipe ]


  def index
    @schedules = current_user.schedules.all.order(:id)
  end

  def show
    @schedule = Schedule.find(params[:id])
    @recipe = @schedule.recipe.find(params[:id])
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.recipe.find(params[:id]).destroy
  end

  def remove_recipe
    @schedule = Schedule.find(params[:id])

    @schedule.recipe = nil
    @schedule.save
    redirect_to schedules_path
  end

  def add_recipe
    @schedule = Schedule.find(params[:id])
    @schedule.update!(recipe_params)
    redirect_to schedules_path
  end

  def choose_recipe
    @schedule = Schedule.find(params[:id])
    @recipes = Recipe.all
  end

private

  # altered to allow the recipe_id for add_recipe action
  def recipe_params
    params.require(:schedule).permit(:recipe_id)
  end

end