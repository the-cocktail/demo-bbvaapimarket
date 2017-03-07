class FunnelController < ApplicationController

  skip_before_filter :authorize, only: [:index]

  def index
    session[:last_url] = "/funnel"
    redirect_to action: :buy and return if session_active?
  end

  def buy
    if @client.accounts.any? && @client.accounts.map{|account| account["balance"]}.max > 8_000
      @text = I18n.t(".more_than_8000")
      @partial = "accounts"
      @price = 180
    elsif @client.accounts.size > 2
      @text = I18n.t(".more_than_2_accounts")
      @partial = "accounts"
      @price = 220
    elsif @client.cards.size >= 2
      @text = I18n.t(".more_or_equal_than_2_cards")
      @partial = "cards"
      @price = 200
    else
      @text = I18n.t(".default_text")
      @partial = "default"
      @price = 250
    end
  end

end
