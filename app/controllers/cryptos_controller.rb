class CryptosController < ApplicationController
  before_action :authenticate_user!
  def index
    @cryptos = current_user.cryptos
  end

  def create
    # Get data from params
    crypto = current_user.cryptos.build(crypto_params)

    if crypto.save
      redirect_to cryptos_path, notice: "Crypto added successfully"
    else
      redirect_to cryptos_path, alert: "Failed to add crypto: #{crypto.errors.full_messages.join(', ')}"
    end
  end

  private

  def crypto_params
    params.require(:crypto).permit(:crypto_name, :crypto_code, :crypto_amount, :euro_invested)
  end
end
