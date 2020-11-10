class CreateRightSwipes < ActiveRecord::Migration[6.0]
  def change
    create_table :right_swipes do |t|
      t.string :user_token
      t.integer :anime_id

      t.timestamps
    end
  end
end
