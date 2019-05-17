class RemoveItemFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :item, index: true, foreign_key: true
    add_reference :reviews, :user, index: true, foreign_key: true
  end
end
