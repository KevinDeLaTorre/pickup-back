require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user  = User.create(name: "example", email: "example@example.com", password: "password")
    @user2 = User.create(name: "example2", email: "example2@example.com", password: "password")
  end

  it "is valid with a name, email, and password" do
    expect(@user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new(name: "", email: "example@example.com", password: "password")
    user.valid?
    expect(user.errors.messages[:name]).to include("can't be blank")
  end

  it "is not valid without an email" do
    user = User.new(name: "example", email: "", password: "password" )
    user.valid?
    expect(user.errors.messages[:email]).to include("can't be blank")
  end

  it "is not valid without a password" do
    user = User.new(name: "kevin", email: "email@example.com", password: "")
    expect(user).to_not be_valid
  end

  it "is not valid with an invalid email" do 
    user = User.new(name: "example", email: "example.com", password: "password")
    expect(user).to_not be_valid
    user.email = "example@"
    expect(user).to_not be_valid
    user.email = "@example.com"
    expect(user).to_not be_valid
    user.email = "example@example"
    expect(user).to_not be_valid
  end

  it "is not valid with a duplicate email" do
    user = User.find_by(email: @user.email).dup
    user.valid?
    expect(user.errors.messages[:email]).to include("has already been taken")
  end

  it "can follow an event successfully" do
    event = Event.create(title: "event", date: Date.tomorrow, start_time: DateTime.tomorrow.noon, creator: @user2.id)
    expect(@user.following.count).to eq(0)
    expect(event.followers.count).to eq(0)
    @user.follow_event(event)
    expect(@user.following.count).to eq(1)
    expect(event.followers.count).to eq(1)
    expect(@user.following?(event)).to be true
    expect(event.has_follower?(@user)).to be true
  end
end
