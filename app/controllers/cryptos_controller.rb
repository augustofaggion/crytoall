class CryptosController < ApplicationController
  def index
    @cryptos = [
      { name: "Bitcoin", symbol: "BTC", price: 50000 },
      { name: "Ethereum", symbol: 'ETH', price: 4000 }, # rubocop:disable Style/StringLiterals
      { name: 'Cardano', symbol: 'ADA', price: 2 } # rubocop:disable Style/StringLiterals
    ]
  end
end
