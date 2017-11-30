module NotificationsHelper

	def notification_alert_message(notification)
		user = User.find(notification.notified_by_user_id)
		return "#{user.user_name} liked your post" if notification.notification_type == 'like'
		"#{user.user_name} commented on your post"
	end

end
