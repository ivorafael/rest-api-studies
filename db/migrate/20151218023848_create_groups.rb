class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :branch_id
      t.boolean :active

      t.timestamps null: false
    end
  end
end
