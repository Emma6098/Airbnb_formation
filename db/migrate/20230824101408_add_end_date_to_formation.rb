class AddEndDateToFormation < ActiveRecord::Migration[7.0]
  def change
    add_column :formations, :end_date, :datetime
  end
end
