class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.string :name
      t.integer :wins
      t.integer :loose
      t.integer :tie

      t.timestamps
    end
  end
end
