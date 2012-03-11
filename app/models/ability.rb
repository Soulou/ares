class Ability
  include CanCan::Ability

  def initialize(user)
    admin_group = Group.where(name: 'admin').first

    if user.group == admin_group
      can :manage, User
      can :manage, Group
    end
  end
end
