class AddAnimeScoreToRightSwipes < ActiveRecord::Migration[6.0]
  def change
    add_column :right_swipes, :score, :string
  end
end
