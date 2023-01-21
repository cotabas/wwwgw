class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.integer :tmdb_id
      t.string :name
      t.json :info

      t.timestamps
    end
    add_index :movies, [:tmdb_id], unique: true
  end
end
