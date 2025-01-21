class ApplicationController < ActionController::Base
  include Pagy::Backend
    before_action :configure_permitted_parameters, if: :devise_controller?
    
      rescue_from ActiveRecord::RecordNotFound, with: :page_not_found 
      rescue_from Pagy::OverflowError, with: :page_not_found 
      rescue_from SQLite3::BusyException, with: :database_is_busy
      # protect_from_forgery with: :null_session
      skip_before_action :verify_authenticity_token
    
        # render 'errors/404'
  protected

  def page_not_found 
    render 'errors/404'
  end
  def database_is_busy
    render root
    alert "The database is currently busy."
  end
  def configure_permitted_parameters
    #adding status
    devise_parameter_sanitizer.permit(:sign_up, keys: [:status] )
    devise_parameter_sanitizer.permit(:account_update, keys: [:status])
    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role] )
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  
    
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def authenticate_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
  def authenticate_status!
    unless current_user&.allowed?
      redirect_to root_path, alert: "You are not permitted to perform this action."
    end
  end
end
