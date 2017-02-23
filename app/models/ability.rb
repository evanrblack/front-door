class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Listing

    # Login only below
    return unless user

    # Can manage their own account
    can %i(create read update), user

    # Give specific abilities
    send("#{user.model_name.singular}_abilities", user)
  end

  def admin_abilities(_admin)
    can :manage, :all
  end

  def agent_abilities(agent)
    can %i(create read update), Listing, agent_id: agent.id
    can :claim, Listing do |listing|
      listing.agent_id.nil? && agent.distance_to(listing) <= 60
    end
    can :list, Listing, agent_id: agent.id

    can %i(create read update), Offer, listing: { agent_id: agent.id }
  end

  def client_abilities(client)
    can %i(create read update), Listing, client_id: client.id
    can :read, Offer, listing: { client_id: client.id }
  end
end
