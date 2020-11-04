class AddOwnerToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :owner, null: false, foreign_key: true
  end
end
