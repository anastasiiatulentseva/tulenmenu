class CreateDishDays < ActiveRecord::Migration
  def change
    create_table :dish_days do |t|
      t.references :dish, index: true, foreign_key: true
      t.date :day

      t.timestamps null: false
    end
  end
end
