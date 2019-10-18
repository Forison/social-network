# frozen_string_literal: true

# frozen_string_literal: true.
class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    receiver = current_user.inverted_friendships.pluck('user_id')
    @recieved_request = User.find(receiver)
    @path_id = current_user.inverted_friendships.ids
    @like = Like.new
    @comment = Comment.new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'post was successfull'
      redirect_to root_path
    else
      flash[:danger] = 'error posting'
      redirect_back fallback_location @post
    end
  end

  def show
    receiver = current_user.inverted_friendships.pluck('user_id')
    @recieved_request = User.find(receiver)
    @like = Like.new
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:postcontent, :user_id, avatar: [])
  end
end
