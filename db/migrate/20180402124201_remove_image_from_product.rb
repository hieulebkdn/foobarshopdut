class RemoveImageFromProduct < ActiveRecord::Migration[5.1]
  def up
    remove_column :products, :image, :string
  end
  def down
    add_column :products, :image, :string
  end
end
