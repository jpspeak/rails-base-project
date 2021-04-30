class CreateBuyersStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers_stocks do |t|
      t.belongs_to :buyer
      t.belongs_to :stock
      t.integer :quantity
      t.float :total_amount
      t.timestamps
    end
  end
end
