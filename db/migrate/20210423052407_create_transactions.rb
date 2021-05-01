class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :buyer
      t.belongs_to :stock
      t.float :price
      t.integer :quantity
      t.float :total_amount
      t.timestamps
    end
  end
end
