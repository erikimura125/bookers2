class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if request.referer == new_user_session_url
      flash[:notice] ="Welcome! You have signed up successfully."
    else
      flash[:notice] ="Signed in successfully."
    end
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    flash[:notice] ="Signed out successfully."
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:introduction])
  end
end