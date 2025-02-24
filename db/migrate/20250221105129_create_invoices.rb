class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :total_price

      t.timestamps
    end
  end
end
