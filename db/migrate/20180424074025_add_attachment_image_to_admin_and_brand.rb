class AddAttachmentImageToAdminAndBrand < ActiveRecord::Migration[5.1]
	def self.up
		change_table :admins do |t|
			t.attachment :image
		end

		change_table :brands do |t|
			t.attachment :image
		end
	end

	def self.down
		remove_attachment :admins, :image
		remove_attachment :brands, :image
	end
end
