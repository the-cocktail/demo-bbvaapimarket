Rails.application.config.middleware.use OmniAuth::Builder do
  CLIENT_ID     = ENV["BBVA_CLIENT_ID"]
  CLIENT_SECRET = ENV["BBVA_CLIENT_SECRET"]
  args = {
    # callback_path: "http://localhost:3000/auth/bbva/callback",
    # environment: 'production'
  }
  provider :bbva , CLIENT_ID, CLIENT_SECRET, args
end



