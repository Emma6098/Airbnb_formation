class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :statut
      t.references :user, foreign_key: true
      t.references :formation, foreign_key: true

      t.timestamps
    end
  end
end
