class AddAnimeTitleToRightSwipes < ActiveRecord::Migration[6.0]
  def change
    add_column :right_swipes, :anime_title, :string
  end
end
