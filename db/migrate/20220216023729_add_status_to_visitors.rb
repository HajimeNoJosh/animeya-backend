class AddStatusToVisitors < ActiveRecord::Migration[6.0]
  def change
    add_column :visitors, :status, :string
  end
end
