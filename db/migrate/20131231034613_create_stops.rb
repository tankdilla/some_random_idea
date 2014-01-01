class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :number
      t.integer :on_street
      t.integer :cross_street
      t.string :daytype
      t.string :location

      t.timestamps
    end
  end
end
