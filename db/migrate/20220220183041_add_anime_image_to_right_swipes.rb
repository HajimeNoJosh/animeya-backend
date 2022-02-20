class AddAnimeImageToRightSwipes < ActiveRecord::Migration[6.0]
  def change
    add_column :right_swipes, :image, :string
  end
end
