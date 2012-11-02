class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.references :statement
      t.string :name
      t.date :planned_date
      t.integer :price

      t.timestamps
    end
    add_index :versions, :statement_id
  end
end
