class CreateRidershipDatasets < ActiveRecord::Migration
  def change
    create_table :ridership_datasets do |t|
      t.string :description
      t.date :as_on
      t.date :ending_on

      t.timestamps
    end
  end
end
