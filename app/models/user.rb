class User < ApplicationRecord

  attr_accessor :profile_picture_url

  has_many :links, dependent: :destroy
  has_many :tags, through: :links

  accepts_nested_attributes_for :links
  has_many :links, inverse_of: :user

  has_secure_password
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :opportunities, dependent: :destroy
  accepts_nested_attributes_for :opportunities, reject_if: :all_blank, allow_destroy: :true

  geocoded_by :location
  after_validation :geocode

  mount_uploader :profile_picture, ProfilePictureUploader

  validates :first_name, presence: true
  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    format: VALID_EMAIL_REGEX,
                    unless: :from_oauth?

  serialize :linkedin_data, Hash

  validates :current_position, presence: true
  validates :location, presence: true

  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

  def from_oauth?
    uid.present? || provider.present?
  end

  def self.find_or_create_from_linkedin(linkedin_data)
    find_by_linkedin(linkedin_data) || create_from_linkedin(linkedin_data)
  end

  def self.find_by_linkedin(linkedin_data)
    find_by(uid:linkedin_data["uid"], provider: linkedin_data["provider"])
  end

  def self.create_from_linkedin(linkedin_data)
    full_name = linkedin_data["info"]["name"].split
    create!(first_name: full_name[0],
            last_name: full_name[1],
            email: linkedin_data["info"]["email"],
            uid: linkedin_data[:uid],
            current_position: linkedin_data["info"]["description"],
            location: linkedin_data["info"]["location"],
            profile_picture: linkedin_data["info"]["image"],
            provider: linkedin_data[:provider],
            linkedin_token: linkedin_data["credentials"]["token"],
            linkedin_secret: linkedin_data["credentials"]["secret"],
            password: SecureRandom.hex(32),
            linkedin_raw_info: linkedin_data)
  end

end
