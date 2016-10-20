class Experience < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :body, presence: true
end
