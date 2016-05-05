class AccountsController < ApplicationController

  def index
    @accounts  = @client.accounts
    @client    = @client.identity
  end

  def show
    @account      = @client.accounts(params[:id])
    @transactions = @client.transactions(params[:id])
  end

end