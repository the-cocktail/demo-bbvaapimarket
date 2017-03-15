class FunnelController < ApplicationController

  skip_before_filter :authorize, only: [:index, :buy]

  before_filter :set_discount_info, only: [:buy_bbva, :payment, :transfer, :transfer_back_url]
  before_filter :set_prices, only: [:buy_bbva, :buy, :payment, :transfer, :transfer_back_url]

  def index
    session[:last_url] = "/funnel"
    redirect_to action: :buy_bbva and return if session_active?
  end

  def buy_bbva
  end

  def buy
  end

  def payment
    @client_data = @client.identity
    @product = params[:id]
    @price = @prices[@product.to_sym]
    set_account
  end

  def transfer
    product = params[:id]
    price = @prices[product.to_sym] * (1.0 - @discount)
    account = @client.accounts.detect{|account| account["id"] == params[:account_id]}
    payload = fake_payload(account["id"], price)
    otp_url, otp_token = @client.get_otp_url_and_token_for(:transfer, payload)
    set_otp_session(otp_token, product.to_sym, account["id"])
    redirect_to otp_url
  end

  def transfer_back_url
    if params["result"] == "OK"
      price = @prices[session[:otp_product]] * (1.0 - @discount)
      payload = fake_payload(session[:otp_account], price)
      @transfer = @client.send_transfer(payload, session[:otp_token])
    end
    reset_otp_session
  end

  private

  def set_otp_session(token, product, account)
    session[:otp_token] = token
    session[:otp_product] = product
    session[:otp_account] = account
  end

  def reset_otp_session
    session[:otp_token] = nil
    session[:otp_product] = nil
    session[:otp_account] = nil
  end

  def fake_payload(account_id, price)
    {
      originAccount: {
        id: account_id
      },
      remoteAccount: {
        name: "ANTONIO JIMENEZ JIMENEZ",
        number: "ES5001824000650201864849",
        bic: "BBVAESMM"
      },
      value: {
        amount: price,
        currency: "EUR"
      },
      transferType: "SEPA",
      feePolicy: "SHARED",
      description: "Pago por transferencia de producto desde demo The Cocktail"
    }
  end

  def set_account
    @account = @client.accounts.detect{|account| account["balance"] > @price}
  end

  def set_prices
    @prices = {nintendo: 250, iphone: 900, samsung: 250}
  end

  def set_discount_info
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

end

