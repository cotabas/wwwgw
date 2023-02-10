class ChangeStreamers < ActiveRecord::Migration[7.0]
  def change
    remove_column :streamers, :netflix
    add_column :streamers, :netflix, :integer
  end
end
