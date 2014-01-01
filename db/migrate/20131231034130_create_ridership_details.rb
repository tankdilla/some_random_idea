class CreateRidershipDetails < ActiveRecord::Migration
  def change
    create_table :ridership_details do |t|
      t.integer :ridership_dataset_id
      t.date :month_beginning_on
      t.integer :stop_id
      t.decimal :boardings
      t.decimal :alightings

      t.timestamps
    end
  end
end
