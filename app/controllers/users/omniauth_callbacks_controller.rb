class Users::OmniauthCallbacksController < ApplicationController

  # def facebook
  #   @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

  #   if @user.persisted?
  #     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  #     sign_in_and_redirect @user, :event => :authentication
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end




  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"])

    if @user.persisted?
      set_flash_message(:notice, :success, :kind => "google_oauth2") if is_navigational_format?
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_oauth2_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  end
end
