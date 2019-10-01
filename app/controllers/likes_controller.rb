# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(like_params)
    if @like.save
      flash[:success] = 'post liked'
      redirect_back fallback_location: @like
    else
      flash[:warning] = 'oops something went wrong'
      redirect_back fallback_location: @like
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    flash[:warning] = 'unliked post'
    redirect_back fallback_location: @like
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id, :status)
  end
end
