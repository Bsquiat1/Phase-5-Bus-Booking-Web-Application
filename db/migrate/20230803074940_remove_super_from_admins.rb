# db/migrate/YYYYMMDDHHMMSS_remove_super_from_admins.rb
class RemoveSuperFromAdmins < ActiveRecord::Migration[6.0]
  def change
    remove_column :admins, :super, :boolean
  end
end
