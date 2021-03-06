class SessionsController < ActionController::Base

  def create
    session[:auth] = request.env['omniauth.auth']
    redirect_to session[:last_url].present? ? session[:last_url] : accounts_path
  end

  def destroy
    session[:auth] = nil
    redirect_to :root
  end

end
