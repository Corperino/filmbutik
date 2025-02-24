class CreatePurchases < ActiveRecord::Migration[8.0]
  def change
    create_table :purchases do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :total_price
      t.integer :points_used

      t.timestamps
    end
  end
end
