class AddImageToBuses < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :image, :string
  end
end
