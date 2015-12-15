class DishDaysController < ApplicationController
  
  def new
    @dish_day = DishDay.new
  end
  
  def create
    @dish_day = DishDay.new(dish_day_params)
    if @dish_day.save
      flash[:success] = "Date has been assigned"
      redirect_to new_dish_day_path
    else
      render "new"
    end
  end
  
  
  private
  
  def dish_day_params
    params.require(:dish_day).permit(:dish_id, :day, :dish_of_the_day)
  end
  
end
