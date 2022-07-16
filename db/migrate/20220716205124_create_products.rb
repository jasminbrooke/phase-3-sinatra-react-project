class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :productname
      t.text :description
      t.boolean :available
      t.integer :cost
      t.integer :price
      t.string :category
      t.string :img_url
    end
  end
end
