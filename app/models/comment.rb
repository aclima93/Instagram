class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :post

  # with every new post object that’s created we need an associated `user_id` and `image`
  validates :user_id, presence: true

end
