class ApplicationController < ActionController::Base
	before_filter :set_gon

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	protected
	def set_gon
  	gon.name_you = session[:name_you]
	end
end
