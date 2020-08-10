class ApplicationController < ActionController::Base

    before_action :store_user_location!, if: :storable_location?
    before_action :configure_permitted_parameters, if: :devise_controller?
    

    def after_sign_in_path_for(resource)
        stored_location_for(resource) || users_path
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :username])
    end

    # for redirecting to current page after user logins/logs out
    # do not store location if req is not a GET, handled by devise controller (infinite loops) or an AJAX req (not sure why)
    def storable_location?
        request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
        store_location_for(:user, request.fullpath)
    end

end
