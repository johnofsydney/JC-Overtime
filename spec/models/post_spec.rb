require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "creation" do

    before do
      u1 = User.create(email: "test@test.com", password: "chicken", password_confirmation: "chicken", first_name: "Jon", last_name: "Snow")
      login_as(u1, :scope => :current_user)

      @post = Post.create(date: Date.today, rationale: "some reason", user_id: current_user.id)
      # @post.user_id = current_user.id
    end

    it "can be created" do

      expect(@post).to be_valid
      # expect(@user).to be_valid
    end

    it "cannot be created without a date and rational" do
      @post.date = nil
      expect(@post).to_not be_valid
    end
  end
end
