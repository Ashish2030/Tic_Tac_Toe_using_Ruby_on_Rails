class ChangeColumnToNewFromTableName < ActiveRecord::Migration[5.2]
  def change
    change_column :details, :wins, :integer, default: 0
    change_column :details, :loose, :integer, default: 0
    change_column :details, :tie, :integer, default: 0
  end
end
