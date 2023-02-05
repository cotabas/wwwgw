class RemoveMovieIdFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_reference :users, :movies, null: false
  end
end
