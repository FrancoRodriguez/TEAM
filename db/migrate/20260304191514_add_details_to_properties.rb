class AddDetailsToProperties < ActiveRecord::Migration[8.0]
  def change
    add_column :properties, :city, :string
    add_column :properties, :square_meters, :integer
    add_column :properties, :coordinates, :string
  end
end
