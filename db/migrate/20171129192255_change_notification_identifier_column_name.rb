class ChangeNotificationIdentifierColumnName < ActiveRecord::Migration[5.1]
	def change
		rename_column :notifications, :identifier, :comment_id
	end
end
