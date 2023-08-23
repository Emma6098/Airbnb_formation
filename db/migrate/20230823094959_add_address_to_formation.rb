class AddAddressToFormation < ActiveRecord::Migration[7.0]
  def change
    add_column :formations, :address, :string
  end
end
