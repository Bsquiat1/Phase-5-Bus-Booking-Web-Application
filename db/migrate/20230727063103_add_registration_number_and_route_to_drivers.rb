class AddRegistrationNumberAndRouteToDrivers < ActiveRecord::Migration[7.0]
  def change
    add_column :drivers, :registration_number, :string
    add_column :drivers, :route, :string
  end
end
