class CreateCryptos < ActiveRecord::Migration[8.0]
  def change
    create_table :cryptos do |t|
      t.string :crypto_name
      t.string :crypto_code
      t.decimal :crypto_amount
      t.decimal :euro_invested
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
