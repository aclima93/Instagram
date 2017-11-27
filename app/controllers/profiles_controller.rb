class ProfilesController < ApplicationController

	before_action :authenticate_user!
	before_action :set_user
	before_action :owned_profile, only: [:edit, :update]

	def show
		@posts = @user.posts.order('created_at DESC')
	end

	def edit
	end

	def update
		if @user.update(profile_params)
			flash[:success] = "Your profile was successfully updated!"
			redirect_to profile_path(@user.user_name)
		else
			flash.now[:error] = "Your profile couldn't be updated! Please check the following:\n#{@user.errors.full_messages}"
			render :edit
		end
	end

	private

	def profile_params
		params.require(:user).permit(:avatar, :bio)
	end

	def set_user
		@user = User.find_by(user_name: params[:user_name])
	end

	def owned_profile
		unless @user.id == current_user.id
			flash[:alert] = "You can't edit other peoples' profiles!"
			redirect_to root_path
		end
	end

end
