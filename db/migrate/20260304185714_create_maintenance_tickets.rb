class CreateMaintenanceTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_tickets do |t|
      t.string :title
      t.text :description
      t.string :status
      t.decimal :budget
      t.boolean :capex
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
