class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.string :vendor
      t.integer :price, null: false
      t.string :currency
      t.integer :stock
      t.string :image_url
      t.string :sku

      t.timestamps
    end
  end
end
