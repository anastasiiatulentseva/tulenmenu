class SuggestedDishesController < ApplicationController
  
  def new
    @suggested_dish = SuggestedDish.new
  end

  def create
    @suggested_dish = SuggestedDish.new(suggested_dish_params)
    if @suggested_dish.save
      flash[:success] = "You have suggested <strong>#{@suggested_dish.name}</strong>."
      redirect_to root_url
    else
      render "new"
    end
  end
  
  def index
    @suggested_dishes = SuggestedDish.all
  end
  
  def show
    @suggested_dish = SuggestedDish.find(params[:id])
  end


  private

  def suggested_dish_params
    params.require(:suggested_dish).permit(:id, :name, :comment)
  end

end