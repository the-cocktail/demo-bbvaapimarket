class AccountsController < ApplicationController

  def index
    @accounts  = @client.accounts["accounts"]
    @client    = @client.identity["client"]   
  end

  def show
    @account  = @client.accounts(params[:id])["account"]
  end

end