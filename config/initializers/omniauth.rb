OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	if Rails.env.production?
  provider :facebook, ENV["facebook_app_id"], ENV["facebook_secret"],
  		   {:scope => 'email', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
end