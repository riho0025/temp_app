class AddIndexToUser < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :name, length: 32
  end
end
