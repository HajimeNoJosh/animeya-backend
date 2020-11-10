class AddTokenToVisitors < ActiveRecord::Migration[6.0]
  def change
    add_column :visitors, :token, :string
  end
end
