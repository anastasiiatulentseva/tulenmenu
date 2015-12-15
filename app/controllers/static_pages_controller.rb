class StaticPagesController < ApplicationController
  
  
  def home
    @dish_of_the_day = DishDay.dish_of_the_day.first
  end

  def about
  end
  
  
  
end
