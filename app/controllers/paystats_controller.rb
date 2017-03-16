class PaystatsController < ApplicationController

  before_filter :set_paystats_client

  def basic_stats
    @stats  = @paystats.zipcode_basic_stats(28020, "201509", 10, "es_home", "month", "201512", "201509")
    @keys = @stats.first.keys
  end

  private

  def set_paystats_client
    @paystats ||= Bbva::Api::Market::Paystats.new({client_id: CLIENT_ID , secret: CLIENT_SECRET})
  end


end
