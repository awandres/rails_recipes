class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all.order(:id)
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
      @schedule = current_user.recipes.all
      @recipes = current_user.recipes.all
    end
end

private

def recipe_params
  params.permit(:recipe, :day)
end
