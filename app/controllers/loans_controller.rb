class LoansController < ApplicationController

  def index
    @loans  = @client.loans
  end

end
