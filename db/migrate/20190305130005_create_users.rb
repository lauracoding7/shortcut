class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password
      t.float :commute_area_center
      t.float :commute_area_radius
      t.integer :commute_price
      t.string :host_service_address
      t.float :host_service_latitude
      t.float :host_service_longitude

      t.timestamps
    end
  end
end
