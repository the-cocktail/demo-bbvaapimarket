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
    @sandbox_user_ids = ["019609283N","50461445C","05745476F","40628930M","64789352P","20120708D","56909291T","49315809Z","09929746W"]
    @sandbox_password = '123456'
  end

end

