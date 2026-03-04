class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.decimal :purchase_price
      t.decimal :current_value
      t.float :occupancy_rate
      t.decimal :monthly_net_income
      t.float :airbnb_score

      t.timestamps
    end
  end
end
