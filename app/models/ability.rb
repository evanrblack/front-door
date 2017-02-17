class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    # Can manage their own account
    can %i[create read update], user.class, id: user.id
    
    case user.class
    when Admin
      can :manage, :all
    when Agent
      can %i[create read update], Listing, agent_id: user.id
    when Client
      can %i[create read update], Listing, client_id: user.id
    end
  end
end
