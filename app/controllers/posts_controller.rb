class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :dislike]
	before_action :owned_post, only: [:edit, :update, :destroy]

	# actions

	def index
		@posts = Post.all.order('created_at DESC').page params[:page]
		# ajax request will result in request.xhr? not nil
		# layout will be true if request is not an ajax request
		render action: :index, layout: request.xhr? == nil
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			flash[:success] = "Your post was successfully created!"
			redirect_to posts_path
		else
			flash.now[:alert] = "Your new post couldn't be created! Please check the form."
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Your post was successfully updated!"
			redirect_to(posts_path(@post))
		else
			flash.now[:alert] = "Your new post couldn't be updated! Please check the form."
			render :edit
		end
	end

	def destroy
		@post.destroy
		flash[:success] = "Your post was successfully deleted!"
		redirect_to posts_path
	end

	def like
		current_user.likes @post
		respond_to do |format|
			format.html { redirect_to :back }
			format.js
		end
	end

	def dislike
		current_user.dislikes @post
		respond_to do |format|
			format.html { redirect_to :back }
			format.js
		end
	end

	private

	def post_params
		params.require(:post).permit(:image, :caption)
	end

	def set_post
		@post = Post.find(params[:id])
	end

	def owned_post
		unless current_user == @post.user
			flash[:alert] = "That post doesn't belong to you!"
			redirect_to root_path
		end
	end

end
