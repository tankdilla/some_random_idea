class CreateRouteStops < ActiveRecord::Migration
  def change
    create_table :route_stops do |t|
      t.integer :stop_id
      t.integer :route_id
      t.integer :ridership_dataset_id

      t.timestamps
    end
  end
end
