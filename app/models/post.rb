class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :post_image, PostImageUploader

  validates :post_title, presence: true, uniqueness:{scope: :post_body}
  validates :post_body, presence: true, length: {minimum: 5}
end
