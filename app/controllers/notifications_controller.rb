class NotificationsController < ApplicationController

	before_action :set_notification, only: %i[link_through]

	def index
		@notifications = current_user.notifications.order('created_at DESC').page params[:page]
		# ajax request will result in request.xhr? not nil
		# layout will be true if request is not an ajax request
		render action: :index, layout: request.xhr?.nil?
	end

	def link_through
		@notification.update read: true
		redirect_to post_path @notification.post
	end

	private

	def set_notification
		@notification = Notification.find(params[:id])
	end

end
