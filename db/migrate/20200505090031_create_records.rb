class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.float :value
      t.timestamps :date
      # t.references :user, foreign_key: true
    end
  end
end
