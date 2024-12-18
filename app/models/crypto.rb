class Crypto < ApplicationRecord
  belongs_to :user

  validates :crypto_name, :crypto_code, :crypto_amount, :euro_invested, presence: true
end
