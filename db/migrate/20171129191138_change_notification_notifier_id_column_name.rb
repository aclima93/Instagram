class ChangeNotificationNotifierIdColumnName < ActiveRecord::Migration[5.1]
	def change
		rename_column :notifications, :subscribed_user_id, :notified_by_user_id
	end
end
