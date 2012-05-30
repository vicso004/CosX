class User < ActiveRecord::Base
  # Inkludera moduler för devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Sätt upp attribut för modellen 
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin
  
  # Skapa association mellan spelare och användare ( 1 till 1)
  belongs_to :player
  
  # Skapa session 
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end
  
  # Hitta användare 
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    
    # Om den redan finns
    if user = self.find_by_email(data.email)
      user        
      
    # Annars, skapa användare och lösenord 
    else  
      self.create!(:email => data.email, :password => Devise.friendly_token[0,20])
      #self.admin = false
    end
  end
  
  # Koppla användare med spelare
  def set_player(name)
    # Om spelare redan finns  
    player = Player.where(:name => name)
  
    # Om spelare inte existerar, skapa den
		if not player.exists?
			player = Player.create(:name => name)
		end    
		# Koppla ihop spelare med användare
		self.player_id = Player.where(:name => name).first.id
  end
             
  # Spelarens kommande matcher  
  def upcomming_matches   
    self.matches.where("datum >= ?",Date.today)
  end
end
