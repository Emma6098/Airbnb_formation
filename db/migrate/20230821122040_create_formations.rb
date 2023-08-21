class CreateFormations < ActiveRecord::Migration[7.0]
  def change
    create_table :formations do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.string :theme
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
