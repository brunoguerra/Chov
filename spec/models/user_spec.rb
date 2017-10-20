require 'rails_helper'

RSpec.describe User, type: :model do
 before do
   @user = User.create(email: "john@doe.com", password: "123456", password_confirmation: "123456", first_name: "John", last_name: "Doe")
 end

  describe "creation" do
    
    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name and last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe "custom name methods" do
    it "has a full name method that combines first_name and last_name" do
      expect(@user.fullname).to eq("John Doe")
    end
  end
end
