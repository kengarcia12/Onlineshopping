class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name
      t.string :description
      t.string :picture
      t.string :status

      t.timestamps
    end
  end
end
