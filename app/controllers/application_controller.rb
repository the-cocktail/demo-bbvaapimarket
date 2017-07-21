require "oauth2"
class ApplicationController < ActionController::Base
  include Bbva::Api::Market
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize


  def authorize
    unless session_active?
      session[:last_url] = request.env["PATH_INFO"]
      redirect_root_if_needed
    else
      @client ||= Bbva::Api::Market::Client.new(session[:auth]["credentials"].merge({client_id: CLIENT_ID , secret: CLIENT_SECRET}))
    end
  end


  private

    def session_active?
      if request.env['omniauth.auth'] || session[:auth]
        refresh_token! if token_expired?
        true
      else
        false
      end
    end

    def token_expired?
      session[:auth] && (session[:auth]["credentials"]["expires_at"] < Time.now.to_i)
    end

    def refresh_token!

      @client = Bbva::Api::Market::Client.new(session[:auth]["credentials"].merge({client_id: CLIENT_ID , secret: CLIENT_SECRET}))
      begin
        data    = JSON.parse(@client.refresh_token)
        Rails.logger.info("refresh_token!")
        #Renovate credentials
        session[:auth]["credentials"]["expires_at"]    = Time.now.to_i + data["expires_in"]
        session[:auth]["credentials"]["token"]         = data["access_token"]
        session[:auth]["credentials"]["refresh_token"] = data["refresh_token"]
      rescue Exception => e
        # refresh_token also have expiration time ("refresh_expires_in"=>43199) so we have to authorize again.
        redirect_to "/auth/bbva"
      end
    end

    def redirect_root_if_needed
      redirect_to :root unless ['/','/auth/bbva'].include?(request.env["PATH_INFO"])
    end

end
