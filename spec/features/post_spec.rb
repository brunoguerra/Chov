require "rails_helper"

describe "posts navigate" do
  describe "posts index page" do
    it "can be reached successfully" do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it "has a title of posts" do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end
  
end
