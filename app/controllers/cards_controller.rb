class CardsController < ApplicationController
  
  def index
    @cards  = @client.cards["cards"]    
  end

  def show
    begin
      @card  = @client.cards(params[:id])["card"]
    rescue Exception => e
      redirect_to "/auth/bbva"
    end
  end

end
