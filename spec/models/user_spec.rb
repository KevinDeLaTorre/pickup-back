require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with a name and email" do
    user = User.new( name: "example", email: "example@example.com" )
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new( name: "", email: "example@example.com" )
    expect(user).not_to be_valid
  end

  it "is not valid without an email" do
    user = User.new( name: "example", email: "" )
    expect(user).not_to be_valid
  end

  it "is not valid with an invalid email" do 
    user = User.new( name: "example", email: "example.com" )
    expect(user).not_to be_valid
    user.email = "example@"
    expect(user).not_to be_valid
    user.email = "@example.com"
    expect(user).not_to be_valid
    user.email = "example@example"
    expect(user).not_to be_valid
  end

  it "is not valid with a duplicate email" do
    user1 = User.new( name: "example", email: "example@example.com" )
    user2 = User.new( name: "example2", email: user1.email )
    expect(user2).not_to be_valid
  end
end
