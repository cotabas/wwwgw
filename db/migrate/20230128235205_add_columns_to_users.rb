class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :movies, null: false, foreign_key: true
    add_column :users, :name, :string
    add_column :users, :streamers, :json
  end
end
