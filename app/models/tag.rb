class Tag < ApplicationRecord

  has_many :links, dependent: :destroy
  has_many :users, through: :links

end
