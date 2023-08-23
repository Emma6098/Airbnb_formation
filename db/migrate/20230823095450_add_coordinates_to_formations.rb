class AddCoordinatesToFormations < ActiveRecord::Migration[7.0]
  def change
    add_column :formations, :latitude, :float
    add_column :formations, :longitude, :float
  end
end
