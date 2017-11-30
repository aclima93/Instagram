class Notification < ApplicationRecord
	
	belongs_to :notified_by_user, class_name: 'User'
	belongs_to :user
	belongs_to :post
	belongs_to :comment, optional: true

	validates :user_id, :notified_by_user_id, :post_id, :notification_type, presence: true

end
