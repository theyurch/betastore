class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#fixdisyurch  protect_from_forgery with: :exception
	helper_method :logged_in?
#
  # before_filter :require_log_in

  # protected
  # def require_log_in
  #   redirect_to '/log_in' unless logged_in?
  # end

  def logged_in?
    cookies.signed[:customer_id].present?
  end

  helper_method :current_customer
  def current_customer
    @current_customer ||= Customer.find(cookies.signed[:customer_id])
  end
#
end
