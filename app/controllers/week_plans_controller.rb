class WeekPlansController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @week_plan = DishDay.where(day: Date.today.all_week)
  end

  
end
