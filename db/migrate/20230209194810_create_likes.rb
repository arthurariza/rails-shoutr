class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shout, null: false, foreign_key: true

      t.timestamps

      t.index %i[user_id shout_id], unique: true
    end
  end
end
