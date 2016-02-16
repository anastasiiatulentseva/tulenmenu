class SuggestedDishesController < ApplicationController
  
  def new
    @suggested_dish = SuggestedDish.new
  end

  def create
    @suggested_dish = SuggestedDish.new(suggested_dish_params)
    respond_to do |format|
      if @suggested_dish.save
        format.js { flash.now[:success] = "You have suggested <strong>#{@suggested_dish.name}</strong>."}
        SuggestedDishMailer.new_suggested_dish(@suggested_dish).deliver_now
      else
        format.js
      end
    end
  end
  
  def index
    @suggested_dishes = SuggestedDish.all
  end
  
  def edit
    @suggested_dish = SuggestedDish.find(params[:id])
  end
  
  def update
    @suggested_dish = SuggestedDish.find(params[:id])
    if @suggested_dish.update_attributes(suggested_dish_params)
      flash[:success] = "Suggested dish have been updated"
      redirect_to suggested_dishes_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @suggested_dish = SuggestedDish.find(params[:id]).destroy
    flash[:success] = "Suggested dish deleted"
    redirect_to suggested_dishes_path
  end
  
  def upgrade
    suggested_dish = SuggestedDish.find(params[:id])
    dish = make_dish(suggested_dish)
    dish.save!
    redirect_to edit_dish_path(dish)
  end


  private

  def suggested_dish_params
    params.require(:suggested_dish).permit(:id, :name, :comment)
  end
  
  def make_dish(suggested_dish)
    Dish.new(name: suggested_dish.name)
  end

end







