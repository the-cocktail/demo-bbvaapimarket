Rails.application.config.middleware.use OmniAuth::Builder do
  CLIENT_ID     = ENV["BBVA_CLIENT_ID"]
  CLIENT_SECRET = ENV["BBVA_CLIENT_SECRET"]
  #if some ENV variables are not defined Omniauth::Bbva will take the default sandbox ones
  args = {
    site:           ENV['BBVA_SITE'], # by default => http://localhost:3000/auth/bbva/callback
    authorize_url:  ENV['BBVA_AUTHORIZE_URL'],
    token_url:      ENV['BBVA_TOKEN_URL'],
    callback:       ENV['BBVA_CALLBACK']
  }
  provider :bbva , CLIENT_ID, CLIENT_SECRET, args
end



