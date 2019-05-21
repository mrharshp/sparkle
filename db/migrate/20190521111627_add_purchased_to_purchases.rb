class AddPurchasedToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :purchased, :boolean,  default: false
  end
end
