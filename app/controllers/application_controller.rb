class ApplicationController < ActionController::Base
	before_action :set_raven_context

  def set_raven_context
    if user_signed_in?
      Raven.user_context(id: current_user.id, email: current_user.email, ip_address: request.ip)    
    else 
      Raven.user_context(id: session.id, ip_address: request.ip)
    end
    Raven.extra_context(params: params.to_unsafe_h, url: request.url, ip_address: request.ip)
  end

  def log_exception(request, params, exception)
    Raven.extra_context(url: request.url, params: params.to_unsafe_h)
    Raven.capture_exception(exception)
  end
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_paper_trail_whodunnit
    before_action :set_action_cable_identifier


    protected
    def authenticate_user!
        if user_signed_in?
            super
        else
            redirect_to new_user_session_path, :notice => 'if you want to add a notice'
            ## if you want render 404 page
            ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
        end
    end
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit({ roles: [] }, :name, :email, :password, :password_confirmation)
        end
    end
    private

    def set_action_cable_identifier
        cookies.encrypted[:session_id] = session.id.to_s
        cookies.encrypted[:user_id] = current_user&.id
    end
end


