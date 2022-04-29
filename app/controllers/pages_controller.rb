class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def market_api
    @total_market = Coinmarketcap.coins(1000)
  end

  def market_price(b)
    b[:asset] = "BCH" if b[:asset] == "BCC"
    b[:asset] = 'MIOTA' if b[:asset] == 'IOTA'
    @total_market.select {|a| a["symbol"] == "#{b[:asset]}"}.first["price_usd"].to_f
  rescue
    0
  end

  def market_change(b)
    b[:asset] = "BCH" if b[:asset] == "BCC"
    b[:asset] = 'MIOTA' if b[:asset] == 'IOTA'
    @total_market.select {|c| c["symbol"] == "#{b[:asset]}"}.first["percent_change_24h"].to_f
    rescue
      0
  end

  def dashboard
