class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  mount_uploader :post_image, PostImageUploader

  validates :post_body, presence: true, length: {minimum: 1}

  def like_for(user)
    likes.find_by_user_id user
  end

end
