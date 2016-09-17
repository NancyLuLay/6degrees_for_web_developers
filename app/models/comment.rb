class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :comment_body, presence: true, uniqueness:{scope: :post_id}
end
