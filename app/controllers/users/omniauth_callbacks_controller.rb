class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
   
  # Gör så att man får tillgång till att logga in 
  skip_authorization_check      
  
  # Inloggning för facebook
  def facebook
    auth = request.env["omniauth.auth"]        
    
    #render :text => request.env["omniauth.auth"].to_yaml , ta bort '#' för att se vad man får ut
    
    # Leta användare 
    @user = User.find_for_facebook_oauth(auth, current_user)
    
    # Om anvöndare hittas 
    if @user.persisted?
      flash[:notice] = "Inloggad med Facebook"

      # Uppdatera avatar 
      @user.avatar_url = auth.info.image #Bild ska uppdateras
      if @user.player == nil
        @user.set_player(auth.info.name)
      end
      sign_in_and_redirect @user, :notice => "Inloggad med facebook"
    
    #Rädda om nått knas   
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


end