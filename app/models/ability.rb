class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Member.new # guest user (not logged in)

    can :read, Event
    can :autocomplete_member_gtid, Event
    can :autocomplete_member_first_name, Event
    can :create, Member

    if !user.gtid.nil?
      can :report, Member
      can [:register_attendee, :unregister_attendee], Event
    end

    can [:show, :edit, :update, :destroy], Member do |m|
      m == user 
    end

    if user.isWebmaster?
      can :manage, :all

    elsif user.isOfficer?
      can :read, :all
      can :manage, [Member, Event, Semester]

    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
