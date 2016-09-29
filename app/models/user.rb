class User < ApplicationRecord

  has_secure_password
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify

  geocoded_by :location
  after_validation :geocode

  mount_uploader :profile_picture, ImageUploader

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    format: VALID_EMAIL_REGEX

  validates :current_position, presence: true
  validates :location, presence: true

  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

end
