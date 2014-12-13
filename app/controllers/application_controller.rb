class ApplicationController < ActionController::Base
  #before_filter :configure_devise_params, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 	protect_from_forgery with: :exception
	before_filter :configure_permitted_parameters, if: :devise_controller?

  	protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| 
      	u.permit(:avatar ,:nome_completo , :cidade ,:estado ,:email_usuario ,:descricao , :email ,:password ,:password_confirmation, :descricao) 
      }
      devise_parameter_sanitizer.for(:account_update) { |u| 
        u.permit(:avatar ,:nome_completo , :cidade ,:estado ,:email_usuario ,:descricao , :email ,:password ,:password_confirmation, :current_password , :descricao) 
      }
	end

def after_sign_in_path_for(resource)
    sign_in_url = url_for("myhome/index")
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

end
