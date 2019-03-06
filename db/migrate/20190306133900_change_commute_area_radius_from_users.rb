class ChangeCommuteAreaRadiusFromUsers < ActiveRecord::Migration[5.2]
  def change
    change_table(:users) do |t|
      t.remove :commute_area_radius
      t.integer :commute_area_radius
    end
  end
end
