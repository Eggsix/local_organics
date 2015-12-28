class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception
	before_action :set_auth

	def set_zipcode
		if is_numeric?(params[:search]) && params[:search].length == 5
			session[:zipcode] = params[:search]
			redirect_to index_view_path
		else
			flash[:errors] = "Please Enter a Valid Zipcode"
			redirect_to "/"
		end
	end
	
	def current_user
	  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	helper_method :current_user
	
	private
	def is_numeric? string
		true if Float(string) rescue false
	end	

	def set_auth
		@auth = session[:omniauth] if session[:omniauth]
	end	
end
