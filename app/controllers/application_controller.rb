class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    private
        def after_sign_in_path_for(resource)
            stored_location_for(resource) || projects_path
        end
    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,:second_name,:email,:password)}
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name,:second_name,:email,:password,:current_password)}
        end            
end
