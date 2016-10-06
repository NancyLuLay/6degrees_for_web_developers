class Link < ApplicationRecord
  belongs_to :user
  belongs_to :tag

  accepts_nested_attributes_for :tag
end
