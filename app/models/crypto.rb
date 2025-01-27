class Crypto < ApplicationRecord
  belongs_to :user

  validates :crypto_name, :crypto_code, :crypto_amount, :euro_invested, presence: true

  before_save :capitalize_crypto_name, :upcase_crypto_code
    # Make first letter captilize
    def capitalize_crypto_name
      self.crypto_name = crypto_name.capitalize if crypto_name.present?
    end

    def upcase_crypto_code
      self.crypto_code = crypto_code.upcase if crypto_code.present?
    end
end
