require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "Sign up" do
    it "is valid with valid signup info" do
      expect(User.find_by(email: "tester@example.com")).to be_nil
      post api_user_registration_path, params: { user: {
        name: "tester",
        email: "tester@example.com",
        password: "password",
        password_confirmation: "password"
      }}
      expect(User.find_by(email: "tester@example.com")).to_not be_nil
    end

    it "is invalid without name" do
      expect(User.find_by(email: "tester@example.com")).to be_nil
      post api_user_registration_path, params: { user: {
        name: "",
        email: "tester@example.com",
        password: "password",
        password_confirmation: "password"
      }}
      expect(response.status).to eq(422) # Unprocessable entity
    end

    it "is invalid without email" do
      expect(User.find_by(email: "tester@example.com")).to be_nil
      post api_user_registration_path, params: { user: {
        name: "tester",
        email: "",
        password: "password",
        password_confirmation: "password"
      }}
      expect(response.status).to eq(422) # Unprocessable entity
    end

    it "is invalid without password" do
      expect(User.find_by(email: "tester@example.com")).to be_nil
      post api_user_registration_path, params: { user: {
        name: "tester",
        email: "tester@example.com",
        password: "",
        password_confirmation: "password"
      }}
      expect(response.status).to eq(422) # Unprocessable entity
    end

    it "is invalid without password_confirmation" do
      expect(User.find_by(email: "tester@example.com")).to be_nil
      post api_user_registration_path, params: { user: {
        name: "tester",
        email: "tester@example.com",
        password: "password",
        password_confirmation: ""
      }}
      expect(response.status).to eq(422) # Unprocessable entity
    end
  end
end
