class CreateRightSwipes < ActiveRecord::Migration[6.0]
  def change
    create_table :right_swipes do |t|
      t.string :room_token
      t.string :user_token
      t.string :anime_id

      t.timestamps
    end
  end
end
