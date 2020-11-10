class AddTokenToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :token, :string
  end
end
