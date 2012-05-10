class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model

    auth = request.env["omniauth.auth"]
    #render :text => request.env["omniauth.auth"].to_yaml
    @user = User.find_for_facebook_oauth(auth, current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"

      # Fixa allt det andra
      @user.avatar_url = auth.info.image
      if @user.player == nil
        @user.set_player(auth.info.name)
      end
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


end