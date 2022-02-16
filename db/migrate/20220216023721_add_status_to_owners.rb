class AddStatusToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :status, :string
  end
end
