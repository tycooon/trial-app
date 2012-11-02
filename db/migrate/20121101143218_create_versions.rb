class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.references :statement
      t.string :name
      t.date :planned_date
      t.integer :price

      t.timestamps
    end
  end
end
