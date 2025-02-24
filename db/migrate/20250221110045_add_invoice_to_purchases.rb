class AddInvoiceToPurchases < ActiveRecord::Migration[8.0]
  def change
    add_reference :purchases, :invoice, null: true, foreign_key: true
  end
end
