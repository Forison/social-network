class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(com_params)
    if @comment.save
      flash[:success] = "comment posted"
      redirect_back fallback_location: @comment
    else
      flash[:warning] = "oops!! comment could not be posted"
      redirect_back fallback_location: @comment
    end

  end
  private 
  def com_params
    params.require(:comment).permit(:commentary, :user_id, :post_id)
  end
end
