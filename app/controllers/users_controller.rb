# frozen_string_literal: true

# frozen_string_literal: true.
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @like = Like.new
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts.reverse
  end
end
