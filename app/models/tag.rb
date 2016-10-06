class Tag < ApplicationRecord

  has_many :links, dependent: :destroy
  has_many :users, through: :links

  def self.tags_for_context(context)
    ActsAsTaggableOn::Tagging.includes(:tag).where(context: context).map{|t| t.tag}
  end

  def self.add_anonymous_tag(tag_name, context)
    return if tags_for_context(context).map(&:name).include?(tag_name)
    t = create(name: tag_name)
    ActsAsTaggableOn::Tagging.create(context: context, tag_id: t.id)
  end

end
