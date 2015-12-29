OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1391703374464561", da0737a29c69625229fd74d53a1c23e4
end