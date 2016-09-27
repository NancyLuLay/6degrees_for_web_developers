class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Post do |post|
      user == post.user
    end

    cannot :manage, Post do |post|
      user != post.user
    end

    can :manage, Comment do |comment|
      user == comment.user
    end

    cannot :manage, Comment do |comment|
      user != comment.user
    end

  end

end
