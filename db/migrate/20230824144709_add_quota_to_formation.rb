class AddQuotaToFormation < ActiveRecord::Migration[7.0]
  def change
    add_column :formations, :quota, :integer
  end
end
