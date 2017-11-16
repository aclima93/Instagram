class Post < ApplicationRecord

  # with every new post object that’s created we need an associated `user_id` and `image`
  validates :user_id, presence: true
  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :posts, dependent: :destroy
end
