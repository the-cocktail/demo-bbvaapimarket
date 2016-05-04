class MeController < ApplicationController

  def index
    begin
      @current_user  = @client.identity["client"]
    rescue Exception => e
      redirect_to "/auth/bbva"
    end
  end

end