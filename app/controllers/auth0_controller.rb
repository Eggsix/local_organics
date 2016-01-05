class Auth0Controller < ApplicationController
  def callback
  	# This stores all the user information that came from Auth0
    # and the IdP
    # session[:userinfo] = request.env['omniauth.auth']

    # Redirect to the URL you want after successfull auth
		auth = request.env["omniauth.auth"]
		session[:omniauth] = auth.except('extra')
		user = User.sign_in_from_omniauth(auth)
		session[:user_id] = user.id
		if session[:user_id]
			redirect_to root_url, notice: "SIGNED IN"
		else
			redirect_to root_url
		end
  end

  def failure
  	# show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end
