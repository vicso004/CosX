class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    #Gusest and all other can
    can :read, Post
    
    #Admin
     if user.admin?
       can :manage, :all

    #Logged in user  
    elsif user.admin != nil
      
      can :read, Player
      can :read, Article
      can :read, Match
    
    end
  end
end
