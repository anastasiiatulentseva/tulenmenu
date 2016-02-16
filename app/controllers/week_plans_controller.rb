class WeekPlansController < ApplicationController
  
  def index
    @week_plan = DishDay.where(day: Date.today.all_week)
  end

  
end
