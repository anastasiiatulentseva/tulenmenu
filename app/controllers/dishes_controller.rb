class DishesController < ApplicationController
  
  
  def index
    @dishes = Dish.all
  end
  
  def new
    @dish = Dish.new
  end
  
  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      flash[:success] = "Dish has been created successfully (I hope)"
      redirect_to new_dish_path 
    else
      flash[:danger] = "Nope!"
      render "new"
    end
      
  end
  
  private
  
  def dish_params
    params.require(:dish).permit(:name, :picture)
  end
  
end
