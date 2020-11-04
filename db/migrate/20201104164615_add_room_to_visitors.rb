class AddRoomToVisitors < ActiveRecord::Migration[6.0]
  def change
    add_reference :visitors, :room, null: false, foreign_key: true
  end
end
