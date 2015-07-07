class ChangeImageColumnProducts < ActiveRecord::Migration
  def change
    def up
      change_column :products, :picture, :string
    end

    def down
      change_column :products, :image, :string
    end
  end
end
