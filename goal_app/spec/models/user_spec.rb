require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validates User model attributes" do 
    it { should validate_presence_of :username }
    it { should validate_presence_of :password_digest }
    it { should validate_presence_of :session_token }
  end
  
  describe "::find_by_credentials" do
    user = User.new(username: "user1", password: "password")
    user.save
    # subject(:user) { User.create(username: "user1", password: "password") }
    context "with valid credentials" do 
      it "returns user" do 
        u2 = User.find_by_credentials("user1", "password")
        expect(u2.username).to eq("user1")
      end 
    end
    
    context "with invalid credentials" do 
      it "return nil" do
        expect(User.find_by_credentials("user4", "password")).to eq(nil)
      end
    end
  end
end
