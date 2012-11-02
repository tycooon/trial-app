class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.datetime :deleted_at
      t.string :name
      t.date :planned_date
      t.integer :price

      t.timestamps
    end
    add_index :statements, :deleted_at
  end
end
