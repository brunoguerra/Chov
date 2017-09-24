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

    describe "creation posts" do
      before do
        visit new_post_path
      end

      it "has a new form that can be reached" do
        expect(page.status_code).to eq(200)
      end

      it "can be created from new form page" do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'Some rationale'
        click_on 'Save'
        expect(page).to have_content('Some rationale')
      end
    end
  end
  
end
