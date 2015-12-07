class TodayMenusController < ApplicationController
  
  def index
    @dish_days = DishDay.where(day: Date.today)
  end
  
  
end
