class AddSuperAdminToAdmins < ActiveRecord::Migration[5.1]
  def up
  	add_column :admins, :super_admin, :boolean, default: false
  end

  def down
  	remove_column :admins, :super_admin
  end
end
