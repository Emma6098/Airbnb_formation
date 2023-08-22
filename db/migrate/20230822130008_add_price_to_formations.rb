class AddPriceToFormations < ActiveRecord::Migration[7.0]
  def change
    add_column :formations, :price, :integer
  end
end
