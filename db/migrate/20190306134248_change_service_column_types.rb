class ChangeServiceColumnTypes < ActiveRecord::Migration[5.2]
  def change
    change_table(:services) do |t|
      t.remove :duration
      t.integer :duration
      t.remove :price
      t.integer :price
    end
  end
end
