class ChangeStatusDatatype < ActiveRecord::Migration
  def change
    def up
      change_column :categories, :status, :boolean
    end

    def down
      change_column :my_table, :my_column, :string
    end
  end
end
