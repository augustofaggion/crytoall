class CryptosController < ApplicationController
  def index
    @cryptos = fetch_cryptos_from_supabase
  end

  def create
    # Get data from params
    crypto_name = params[:crypto_name]
    crypto_code = params[:crypto_code]
    crypto_amount = params[:crypto_amount]
    euro_invested = params[:euro_invested]

    insert_crypto_to_supabase(crypto_name, crypto_code, crypto_amount, euro_invested)
  end

  private

  def fetch_cryptos_from_supabase
    # Fetch data from Supabase
    client = Supabase::Client.new(url: ENV["DATABASE_URL"], api_key: ENV["API_KEY_SUPABASE"])
    response = client.from("cryptos").select("*").eq("user_id", user_id).execute
    response.body["data"] || []
  end

  def insert_crypto_to_supabase(crypto_name, crypto_code, crypto_amount, euro_invested)
    client = Supabase::Client.new(url: ENV["DATABASE_URL"], api_key: ENV["API_KEY_SUPABASE"])
    client.from("cryptos").insert([
      {
        crypto_name: crypto_name,
        crypto_code: crypto_code,
        crypto_amount: crypto_amount,
        euro_invested: euro_invested,
        user_id: current_user.id
      }
    ]).execute
  end
end
