class ChangeColumnsOnMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :poster, :string
    add_column :movies, :release, :string
    add_column :movies, :imdb, :integer
    add_column :movies, :runtime, :integer
    remove_column :movies, :info
  end
end
