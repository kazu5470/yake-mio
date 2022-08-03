class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.integer :address
      t.float :latitude
      t.float :longitude
      t.references :review_id
      t.timestamps
    end
  end
end
