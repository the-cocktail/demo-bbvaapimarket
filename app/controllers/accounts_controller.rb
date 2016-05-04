class AccountsController < ApplicationController

  def index
    @accounts  = @client.accounts["accounts"]
    @identity  = @client.identity["client"]   
  end

end