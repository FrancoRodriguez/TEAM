class AddImageToProperties < ActiveRecord::Migration[8.0]
  def change
    add_column :properties, :image_url, :string
  end
end
