class PostsController < ApplicationController
  def index 
    @posts = Post.all 
  end
  def new
    @post = Post.new
  end
  def create 
    @post = current_user.build(post_params)
    if @post.save
      flash[:success] = 'post was successfull'
      redirect_to root_path
    else
      flash[:danger] = 'error posting'
      redirect_back fallback_location(pos)
    end
  end
  private 
  def post_params
    params.require(:post).permit(:postcontent,:user_id)
  end
end
