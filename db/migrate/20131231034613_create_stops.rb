class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :number
      t.integer :on_street_id
      t.integer :cross_street_id
      t.string :daytype
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
  end
end
