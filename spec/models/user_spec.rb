require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(email: "email@example.com", password: "password") }
  
  it "is valid" do
    expect(user).to be_valid
  end
  
  it { is_expected.to validate_length_of(:name) }
  
end