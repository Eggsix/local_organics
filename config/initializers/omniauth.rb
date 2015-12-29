OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
<<<<<<< HEAD
  provider :facebook, ENV["facebook_app_id"], ENV["facebook_secret"]
  		   {:scope => 'email', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
=======

  provider :facebook, "facebook_app_id", "facebook_secret"

>>>>>>> ba8973e225cd334c0aa402a25a9d3c95a0e409a8
end