class CreateStreamers < ActiveRecord::Migration[7.0]
  def change
    create_table :streamers do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :disney, default: false
      t.boolean :netflix, default: false
      t.boolean :hbo, default: false
      t.boolean :prime, default: false
      t.boolean :apple, default: false
      t.boolean :paramount, default: false

      t.timestamps
    end
  end
end
