class AccountsController < ApplicationController

  def index
    @accounts = [
      { 
        malias: 'Mi cuenta',
        number: '43242342',
        currency: 'E',
        balance: 345.89
      }
    ]
  end

end