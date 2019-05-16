class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :photo
      t.string :category
      t.string :gender
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
