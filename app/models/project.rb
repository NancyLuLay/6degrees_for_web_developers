class Project < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :body, presence: true

  mount_uploader :project_image, ProjectImageUploader
end
