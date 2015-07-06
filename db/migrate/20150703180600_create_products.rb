class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :available_size
      t.integer :price

      t.timestamps
    end
  end
end
