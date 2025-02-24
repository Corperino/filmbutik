class AddAwardedPointsToPurchases < ActiveRecord::Migration[8.0]
  def change
    add_column :purchases, :points_awarded, :integer
  end
end
