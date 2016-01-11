class DishesController < ApplicationController
  
  
  def index
    @dishes = Dish.all.order(updated_at: :desc)
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
      render "new"
    end
  end
  
  def edit
    @dish = Dish.find(params[:id])
  end
  
  def update
    @dish = Dish.find(params[:id])
    if @dish.update_attributes(dish_params)
      flash[:success] = "Dish have been updated"
      redirect_to edit_dish_path
    else
      render 'edit'
    end
  end
  
  private
  
  def dish_params
    params.require(:dish).permit(:name, :picture)
  end
  
end
