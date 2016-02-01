class DishDaysController < ApplicationController
  
  before_action :set_default_date
  
  def new
    @dish_day = DishDay.new
  end
  
  def create
    @dish_day = DishDay.new(dish_day_params)
    if @dish_day.save
      session[:last_used_date] = @dish_day.day
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
  
  def set_default_date
    @default_date ||= if session[:last_used_date].present? && Date.parse(session[:last_used_date]) > Date.today
      Date.parse(session[:last_used_date])
    else
      Date.today
    end
  end
  
end
