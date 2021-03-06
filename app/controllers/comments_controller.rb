class CommentsController < ApplicationController
	before_action :set_post

	def index
		@comments = @post.comments.order('created_at ASC')

		respond_to do |format|
			format.html { render layout: !request.xhr? }
		end
	end

	def create
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save

			# generate a notification for the successful act of creating a comment
			create_notification @post, @comment

			# dynamic reload with AJAX
			respond_to do |format|
				format.html { redirect_to root_path }
				format.js
			end
		else
			flash[:alert] = 'Check the comment form, somethign went horribly wrong!'
			render root_path
		end
	end

	def destroy
		@comment = @post.comments.find(params[:id])

		if @comment.user_id == current_user.id
			@comment.destroy
			# dynamic reload with AJAX
			respond_to do |format|
				format.html { redirect_to root_path }
				format.js
			end
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_post
		@post = Post.find(params[:post_id])
	end

	def create_notification(post, comment)
		# don't notify the current user if he owns the post
		return if post.user_id == current_user.id
		Notification.create(user_id: post.user_id, notified_by_user_id: current_user.id, post_id: post.id, comment_id: comment.id, notification_type: 'comment')
	end

end
