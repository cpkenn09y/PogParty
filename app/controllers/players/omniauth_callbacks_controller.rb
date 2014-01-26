class Players::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/player.rb)
    @player = Player.find_for_facebook_oauth(request.env["omniauth.auth"])

    if @player.persisted?
      sign_in_and_redirect @player, :event => :authentication #this will throw if @player is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end
end
