class AddMovieToPurchases < ActiveRecord::Migration[8.0]
  def change
    add_reference :purchases, :movie, null: false, foreign_key: true
  end
end
