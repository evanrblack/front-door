class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Listing
    
    # Login only below
    return unless user
    
    # Can manage their own account
    can %i[create read update], user

    # Give specific abilities
    send("#{user.model_name.singular}_abilities", user)
  end
  
  def admin_abilities(admin)
    can :manage, :all
  end

  def agent_abilities(agent)
    can %i[create read update], Listing, agent_id: agent.id
  end

  def client_abilities(client)
    can %i[create read update], Listing, client_id: client.id
  end
end
