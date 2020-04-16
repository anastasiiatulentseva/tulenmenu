class TodayMenusController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @dish_days = DishDay.where(day: Date.today)
  end
  
  
end
