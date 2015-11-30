class DishesController < ApplicationController
  
  def index
    @dishes = Dish.all
  end
  
  def new
  end
  
  def create
  end
  
  
end
