class AddRememberDigestToAdmins < ActiveRecord::Migration[5.1]
  def up
  	add_column :admins, :remember_digest, :string
  end

  def down
  	remove_column :admins, :remember_digest
  end
end
