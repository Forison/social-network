require "rails_helper"

RSpec.describe Post, type: :model do
  describe "describes validation" do
    before(:each) do
      @user = create(:user)
    end
    it "is valid " do
      my_post = create(:post, postcontent: " This is random text for post ", user_id: @user.id)
      expect(my_post).to be_valid
    end
    it " Invalid for non auth users" do
      post = build(:post, postcontent: "")
      expect(post).not_to be_valid
    end
    it "is invalid if user does not exist " do
      my_sec_post = build(:post, postcontent: " This is random text for post ", user_id: "")
      expect(my_sec_post).not_to be_valid
    end
  end

  describe "describes associations" do
    context "describes association between user and post " do
      it { should belong_to(:author).class_name("User") }
    end
  end
end
