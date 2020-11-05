class AddVisitorsJoinedToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :Rooms, :visitors_joined, :boolean
  end
end
