require 'rails_helper'

RSpec.describe SuggestedDish, type: :model do
  let(:suggested_dish) { SuggestedDish.new(name: "new dish", comment: "new comment") }
  
  it "is valid with a name and a comment" do
    expect(suggested_dish).to be_valid
  end
  
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:comment) }
  
  it { is_expected.to validate_length_of(:name) }
  it { is_expected.to validate_length_of(:comment) }
  
end
  