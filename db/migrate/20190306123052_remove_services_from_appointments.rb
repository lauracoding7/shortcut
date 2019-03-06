class RemoveServicesFromAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_reference(:appointments, :services, index: true)
  end
end
