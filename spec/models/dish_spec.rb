require 'rails_helper'

RSpec.describe Dish, type: :model do
  let(:dish) { Dish.new(name: "new dish") }

  it "is valid with a name" do
    expect(dish).to be_valid
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name) }
end

