class SessionsController < ApplicationController
	
	@@extension_url = ""
	
	# (JSON) Extension calls authorize, wich starts google oauth
	def authorize
		@@extension_url = params[:redirect_uri]
		redirect_to('/auth/google_oauth2')
	end

	# (JSON) Upon succesful verification, google calls create wich sends the token to the extension
	def create
		@user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
		puts("="*80)
		puts(@user)
		puts("="*80)
		redirect_to(@@extension_url + '?access_token=' + @user.oauth_token)
	end


	# (JSON) In case the user cancels the process, we return a null token to the extension
	def failure
		redirect_to(@@extension_url + '?access_token=' + 'failure')
	end

	# (HTML) login
	def login
		@user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
		redirect_to(root_path)
	end

	# (HTML) logout
	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

	
	def session_params
      params.fetch(:redirect_uri, {})
	end

end