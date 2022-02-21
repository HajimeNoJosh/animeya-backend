class AddVisitorsJoinedToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :visitors_joined, :boolean
  end
end
