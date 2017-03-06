class MeController < ApplicationController

  def index
    begin
      @current_user  = @client.identity
    rescue Exception => e
      redirect_to "/auth/bbva"
    end
  end

  #Sandbox user ids for all of them the password is '123456'
  def samples
    @sandbox_user_ids = ["00000034B","00001000B","46757760W","78000000P"]
    @sandbox_password = '123456'
  end

end

