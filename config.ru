# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

    use Rack::Session::Cookie, :secret => "da0737a29c69625229fd74d53a1c23e4"

    use OmniAuth::Builder do
      provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], :scope => 'email,read_stream'
    end


run Rails.application
