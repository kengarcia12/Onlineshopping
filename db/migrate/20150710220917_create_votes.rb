class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :product, index: true

      t.timestamps
    end
  end
end
