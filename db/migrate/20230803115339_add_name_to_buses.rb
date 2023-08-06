# db/migrate/YYYYMMDDHHMMSS_add_name_to_buses.rb
class AddNameToBuses < ActiveRecord::Migration[6.0]
  def change
    add_column :buses, :name, :string
  end
end
