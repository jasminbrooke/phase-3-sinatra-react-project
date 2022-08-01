class AddFavoriteToProducts < ActiveRecord::Migration[6.1]
  def change
    change_table :products do |t|
      t.column :favorite, :boolean, default: false
    end
  end
end
