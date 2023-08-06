# db/migrate/YYYYMMDDHHMMSS_add_is_superadmin_to_admins.rb
class AddIsSuperadminToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :is_superadmin, :boolean, default: false
  end
end
