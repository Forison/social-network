# frozen_string_literal: true

# frozen_string_literal: true.
class UsersController < ApplicationController
  def index
    @sent_request = current_user.friendships.pluck('friend_id')
    receiver = current_user.inverted_friendships.pluck('user_id')
    @path_id = current_user.inverted_friendships.ids
    @recieved_request = User.find(receiver)
    @friendship = Friendship.new
    @users = User.all_except(current_user)
  end

  def show
    receiver = current_user.inverted_friendships.pluck('user_id')
    @recieved_request = User.find(receiver)
    @like = Like.new
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts.reverse
  end
end
