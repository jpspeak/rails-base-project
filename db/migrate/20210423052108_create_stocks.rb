class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.belongs_to :broker
      t.string :symbol
      t.string :company_name
      t.float :latest_price
      t.float :change
      t.float :change_percent
      t.float :market_cap
      t.timestamps
    end
  end
end
