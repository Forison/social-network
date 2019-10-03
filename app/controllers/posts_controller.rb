# frozen_string_literal: true

# frozen_string_literal: true.
class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @like = Like.new
    @comment = Comment.new
    @post = Post.new
    @posts = Post.ordered_post
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'post was successfull'
      redirect_to root_path
    else
      flash[:danger] = 'error posting'
      redirect_back fallback_location(pos)
    end
  end

  def show
    @like = Like.new
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:postcontent, :user_id, avatar: [])
  end
end
