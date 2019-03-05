class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :barber, foreign_key: { to_table: :users }
      t.references :client, foreign_key: { to_table: :users}
      t.references :services, foreign_key: true
      t.string :location_address
      t.float :location_latitude
      t.float :location_longitude
      t.datetime :datetime
      t.string :state

      t.timestamps
    end
  end
end
