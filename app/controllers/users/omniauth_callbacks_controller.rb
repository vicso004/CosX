class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  skip_authorization_check
  def facebook
    
    auth = request.env["omniauth.auth"]
    #render :text => request.env["omniauth.auth"].to_yaml för att se vad man får ut
    @user = User.find_for_facebook_oauth(auth, current_user)

    if @user.persisted?
      flash[:notice] = "Inloggad med Facebook"

      # Fixa allt det andra
      @user.avatar_url = auth.info.image #Bild ska uppdateras
      if @user.player == nil
        @user.set_player(auth.info.name)
      end
      sign_in_and_redirect @user, :notice => "Inloggad med facebook"
    else #Rädda om nått knas
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


end