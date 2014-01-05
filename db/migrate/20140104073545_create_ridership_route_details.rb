class CreateRidershipRouteDetails < ActiveRecord::Migration
  def change
    create_table :ridership_route_details do |t|
      t.integer :ridership_dataset_id
      t.integer :route_id
      t.decimal :total_boardings
      t.decimal :total_alightings
      t.decimal :median_boardings
      t.decimal :median_alightings
      t.timestamps
    end
  end
end
