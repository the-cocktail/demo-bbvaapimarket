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
    @sandbox_user_ids = ["50461445C","05745476F","40628930M","64789352P","20120708D","56909291T","49315809Z","09929746W",
    "72458025K","08033587D","12345677J","50865368V","06291718E","29158696D","08906932K","08453435S","05539848E","66472433H",
    "05947759M","76575274V","00001025J","00007839L","00006939Q","90247804J","16038978C","00001980W","Y9849764M","00000002W",
    "X5665631H","12345619R","19609283N","62956421Q","32036859K","78000000P","46757760W","00001000B","00000034B"]
    @sandbox_password = '123456'
  end

end

