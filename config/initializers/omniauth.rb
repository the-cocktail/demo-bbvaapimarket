Rails.application.config.middleware.use OmniAuth::Builder do
  CLIENT_ID     = Settings.bbva.client_id
  CLIENT_SECRET = Settings.bbva.client_secret
  #if some ENV variables are not defined Omniauth::Bbva will take the default sandbox ones
  args = {
    site:           Settings.bbva.site,
    authorize_url:  Settings.bbva.authorize_url,
    token_url:      Settings.bbva.token_url,
    callback:       Settings.bbva.callback # by default => http://localhost:3000/auth/bbva/callback
  }
  provider :bbva , CLIENT_ID, CLIENT_SECRET, args
end



