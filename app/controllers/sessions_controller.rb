class SessionsController < ActionController::Base

  def create
    session[:auth] = request.env['omniauth.auth']
    redirect_to session[:last_url]
  end
  
end
