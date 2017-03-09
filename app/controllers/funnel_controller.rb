class FunnelController < ApplicationController

  skip_before_filter :authorize, only: [:index, :buy]

  def index
    session[:last_url] = "/funnel"
    redirect_to action: :buy_bbva and return if session_active?
  end

  def buy_bbva
    @prices = [250, 900, 250]
    if @client.accounts.any? && @client.accounts.map{|account| account["balance"]}.max > 8_000
      @text = I18n.t(".more_than_8000")
      @partial = "accounts"
      @discount = 0.3
    elsif @client.accounts.size > 2
      @text = I18n.t(".more_than_2_accounts")
      @partial = "accounts"
      @discount = 0.2
    elsif @client.cards.size >= 2
      @text = I18n.t(".more_or_equal_than_2_cards")
      @partial = "cards"
      @discount = 0.1
    else
      @text = I18n.t(".default_text")
      @partial = "default"
      @discount = 0.0
    end
  end

  def buy
    @prices = [250, 900, 250]
  end

end

