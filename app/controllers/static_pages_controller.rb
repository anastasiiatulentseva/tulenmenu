class StaticPagesController < ApplicationController
  
  
  def home
    @dish_of_the_day = DishDay.dish_of_the_day.first
    @suggested_dish = SuggestedDish.new
  end

  def about
  end
  
  
  
end
