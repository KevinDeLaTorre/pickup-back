require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with a name and email" do
    user = User.new(name: "example", email: "example@example.com")
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new( name: "", email: "example@example.com" )
    user.valid?
    expect(user.errors.messages[:name]).to include("can't be blank")
  end

  it "is not valid without an email" do
    user = User.new( name: "example", email: "" )
    user.valid?
    expect(user.errors.messages[:email]).to include("can't be blank")
  end

  it "is not valid with an invalid email" do 
    user = User.new( name: "example", email: "example.com" )
    expect(user).to_not be_valid
    user.email = "example@"
    expect(user).to_not be_valid
    user.email = "@example.com"
    expect(user).to_not be_valid
    user.email = "example@example"
    expect(user).to_not be_valid
  end

  it "is not valid with a duplicate email" do
    User.create( name: "example", email: "example@example.com" )
    user = User.find_by(email: "example@example.com").dup
    user.valid?
    expect(user.errors.messages[:email]).to include("has already been taken")
  end
end
