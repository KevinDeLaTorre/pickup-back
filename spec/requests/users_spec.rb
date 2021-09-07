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

  describe "Sign in" do
    it "is valid with correct information" do
      # Create user
      post api_user_registration_path, params: { user: {
        name: "tester",
        email: "tester@example.com",
        password: "password",
        password_confirmation: "password"
      }}
      # Log in
      user = User.find_by(email: "tester@example.com")
      expect(user).to_not be_nil
      post api_user_session_path, params: { 
        email: "tester@example.com",
        password: "password"
      }
      expect(response.status).to eq(200)
      expect(response.headers["Access-Token"]).to_not be_nil
      expect(response.headers["Client"]).to_not be_nil
      expect(response.headers["Uid"]).to_not be_nil
    end

    it "is invalid with wrong email/password" do
      # Create user
      post api_user_registration_path, params: { user: {
        name: "tester",
        email: "tester@example.com",
        password: "password",
        password_confirmation: "password"
      }}
      # Log in
      user = User.find_by(email: "tester@example.com")
      expect(user).to_not be_nil
      post api_user_session_path, params: { 
        email: "tester@example.com",
        password: ""
      }
      expect(response.status).to eq(401)
      expect(response.headers["Access-Token"]).to be_nil
      expect(response.headers["Client"]).to be_nil
      expect(response.headers["Uid"]).to be_nil
    end
  end
end
