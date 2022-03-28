class ApplicationController < ActionController::Base
	before_action :set_current_user
	
	def set_current_user
	  Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
	end
	
	def user_must_be_logged_in
	  redirect_to "/404" if Current.user.nil?
	end
end
