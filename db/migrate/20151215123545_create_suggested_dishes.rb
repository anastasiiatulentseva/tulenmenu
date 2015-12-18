class CreateSuggestedDishes < ActiveRecord::Migration
  def change
    create_table :suggested_dishes do |t|
      t.string :name
      t.string :comment

      t.timestamps null: false
    end
  end
end
