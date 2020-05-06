class AddColumnToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :date, :timestamp
  end
end
