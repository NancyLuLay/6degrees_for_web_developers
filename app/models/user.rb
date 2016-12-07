class User < ApplicationRecord
  TAG_CONTEXTS = [:educational_institution,
                  :level_of_education,
                  :specialization,
                  :language_and_technology,
                  :framework_and_library,
                  :application_testing,
                  :front_end_skill,
                  :back_end_skill,
                  :additional_keyword]

  acts_as_taggable
  acts_as_taggable_on TAG_CONTEXTS

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :current_position, presence: true
  validates :location, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    format: VALID_EMAIL_REGEX,
                    unless: :from_oauth?

  attr_accessor :profile_picture_url

  has_secure_password

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy

  has_many :followeds, through: :active_relationships
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :experiences, dependent: :destroy
  accepts_nested_attributes_for :experiences,
                                reject_if: :all_blank,
                                allow_destroy: :true

  has_many :projects, dependent: :destroy
  accepts_nested_attributes_for :projects,
                                reject_if: :all_blank,
                                allow_destroy: :true

  has_many :openings, dependent: :destroy
  accepts_nested_attributes_for :openings,
                                reject_if: :all_blank,
                                allow_destroy: :true

  geocoded_by :location
  after_validation :geocode

  mount_uploader :profile_picture, ProfilePictureUploader

  serialize :linkedin_data, Hash

  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

# LinkedIn Oauth
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
    byebug
    create!(first_name: full_name[0],
            last_name: full_name[1],
            email: linkedin_data["info"]["email"],
            uid: linkedin_data[:uid],
            current_position: linkedin_data["info"]["description"],
            location: linkedin_data["info"]["location"],
            provider: linkedin_data[:provider],
            linkedin_token: linkedin_data["credentials"]["token"],
            linkedin_secret: linkedin_data["credentials"]["secret"],
            password: SecureRandom.hex(32),
            linkedin_raw_info: linkedin_data)
  end

  # Returns a user newsfeed
 def feed
   following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
   Post.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id).order("created_at DESC")
 end

  # Follows a user
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

end
