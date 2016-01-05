Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'GnnpEsH73Ah77BOQTK754470qYwZftrE',
    '9-XaC8ghiW1XPw21fzl4EIR6ZGdcFR-gcLZjgZ4JlsIvRmGusr74neGJ797B4pj-',
    'steven5211.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end