# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    unless params[:confirmed]
      @friendship = current_user.friendships.build(friend_params)
      if @friendship.save
        flash[:success] = 'request sent'
      else
        flash[:danger] = 'oops!! request failed'
      end
      redirect_to users_path
    end
  end

  def update
    friend = Friendship.find(params[:id])
    if friend.update_attribute(:confirmed, 'true')
      flash[:success] = 'your info was updated'
    else
      flash[:warning] = 'oops!! request failed'
    end
    redirect_back fallback_location: '/'
  end

  private

  def friend_params
    params.require(:friendship).permit(:user_id, :confirmed, :friend_id)
  end
end
