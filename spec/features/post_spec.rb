require "rails_helper"

describe "posts navigate" do
  before do
    @user = User.create(email: "john@doe.com", password: "123456", password_confirmation: "123456", first_name: "John", last_name: "Doe")
    login_as(@user, :scope => :user)
  end

  describe "posts index page" do
    before do
      visit posts_path
    end

    it "can be reached successfully" do
      expect(page.status_code).to eq(200)
    end

    it "has a title of posts" do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end

    it "has a list of posts" do
      post1 = Post.create(date: Date.today, rationale: "Post1", user_id: @user.id)
      post2 = Post.create(date: Date.today, rationale: "Post2", user_id: @user.id)

      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
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

      it "have a user associated it" do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: 'User Association'
        click_on 'Save'
 
        expect(User.last.posts.last.rationale).to eq('User Association')
      end

    end
  end
end
