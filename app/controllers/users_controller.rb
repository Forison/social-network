class UsersController < ApplicationController
	
	def index 
	  @users = User.all
	end

	def show
		@user = User.find(params[:id])
		@post = Post.new
		@posts = current_user.posts.reverse
	end
	def edit 
	  @user = User.find(params[:id])
	end

	def update 
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success]="your info was updated"
      redirect_to edit_user_path(@user)
      else 
        flash[:warning]=@user.errors.full_messages
        redirect_to edit_user_path(@user)
      end
    end
end
