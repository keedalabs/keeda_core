class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_paper_trail_whodunnit
    protected
    def authenticate_user!
        if user_signed_in?
            super
        else
            redirect_to login_path, :notice => 'if you want to add a notice'
            ## if you want render 404 page
            ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
        end
    end
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit({ roles: [] }, :name, :email, :password, :password_confirmation)
        end
    end
end


