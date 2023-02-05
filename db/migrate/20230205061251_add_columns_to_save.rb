class AddColumnsToSave < ActiveRecord::Migration[7.0]
  def change
    add_reference :saves, :user, null: false, foreign_key: true
    add_reference :saves, :movie, null: false, foreign_key: true
  end
end
