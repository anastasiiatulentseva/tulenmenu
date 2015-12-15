class AddDishOfTheDayToDishDays < ActiveRecord::Migration
  def change
    add_column :dish_days, :dish_of_the_day, :boolean, default: false
  end
end
