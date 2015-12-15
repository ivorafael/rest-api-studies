class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :slug
      t.integer :school_id
      t.boolean :active

      t.timestamps null: false
    end
  end
end
