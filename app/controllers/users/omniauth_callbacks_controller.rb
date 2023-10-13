class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth_google(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url
    end
  end

  def microsoft_office365
    @user = User.from_omniauth_msft(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Microsoft") if is_navigational_format?
    else
      # Save the auth data in the session for use in the registration completion form
      session["devise.azure_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to complete_registration_path # Direct them to a custom registration completion page
    end
  end
end
