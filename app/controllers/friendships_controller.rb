class FriendshipsController < ApplicationController
	def create
		@friendship = current_user.friendships.build(friend_params)
		if @friendship.save
			flash[:success] = 'request sent'
		else
			flash[:warning] = 'oops request failed'
		end
		redirect_back fallback_location @friendship  
	end

  private           
	def friend_params
		params.require(:friendship).permit(:confirmed, :friend)
	end
end
