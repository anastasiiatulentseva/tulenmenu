require 'rails_helper'

RSpec.describe DishDay, type: :model do
  let(:dish) {Dish.create(name: 'some dish')}
  let(:dish_day) { DishDay.new(dish_id: dish.id, day: Date.today) }

  it "is valid with dish id and day" do
    expect(dish_day).to be_valid
  end

  it { is_expected.to validate_presence_of(:dish) }
  it { is_expected.to validate_presence_of(:day) }

  it "is invalid when create with a day that have already passed" do
    dish_day = DishDay.new(dish_id: 1, day: Date.yesterday)
    dish_day.valid?
    expect(dish_day.errors[:day]).to include("can't be in the past")
  end

  it "is valid when save past dish-days after editing" do
    dish_day.day = Date.yesterday
    dish_day.valid?
    expect(dish_day.errors[:day]).to include("can't be in the past")
  end
end
