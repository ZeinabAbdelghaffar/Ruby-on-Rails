class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # Guests can read articles and comments
    can :read, Article
    can :read, Comment

    return unless user.present?

    # Logged-in users can create and manage their own articles and comments
    can :create, Article
    can :manage, Article, user_id: user.id
    can :create, Comment
    can :manage, Comment, user_id: user.id

    # Admin users can manage everything
    can :manage, :all if user.admin?
  end
end
