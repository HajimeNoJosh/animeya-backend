class AddVisitorToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :visitor, null: false, foreign_key: true
  end
end
