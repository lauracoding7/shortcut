class EditedSchema < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :commute_area_center
    add_column :users, :commute_area_address, :string
    add_column :users, :commute_area_latitude, :float
    add_column :users, :commute_area_longitude, :float
  end
end
