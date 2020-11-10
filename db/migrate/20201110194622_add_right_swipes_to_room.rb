class AddRightSwipesToRoom < ActiveRecord::Migration[6.0]
  def change
    add_reference :right_swipes, :room, null: false, foreign_key: true
  end
end
