class AddDistanceToFormations < ActiveRecord::Migration[7.0]
  def change
    add_column :formations, :distance, :boolean, default: false
  end
end
