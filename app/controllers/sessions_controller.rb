class SessionsController < ApplicationController
	
	@@extension_url = ""
	
	def authorize
		@@extension_url = params[:redirect_uri]
		redirect_to('/auth/google_oauth2')
	end

	def create
		@user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
		redirect_to(@@extension_url + '?access_token=' + @user.oauth_token)
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
	
	def session_params
      params.fetch(:redirect_uri, {})
	end

end