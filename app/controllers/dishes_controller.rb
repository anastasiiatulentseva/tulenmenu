class DishesController < ApplicationController
  
  
  def index
    @dishes = Dish.all
  end
  
  def new
    @dish = Dish.new
  end
  
  def create
    @dish = Dish.new(dish_params)
    flash[:success] = "Dish has been created successfully (I hope)" if @dish.save
    redirect_to new_dish_path 
  end
  
  private
  
  def dish_params
    params.require(:dish).permit(:name, :picture)
  end
  
end
