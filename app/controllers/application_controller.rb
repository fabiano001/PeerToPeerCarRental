class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action(:set_locale)
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_locale
  	I18n.locale = params[:locale]
  end

  protected
  def configure_permitted_parameters
  	permitted = devise_parameter_sanitizer.for(:sign_up)

  	permitted.push(:name)
  	return permitted
  end

end
