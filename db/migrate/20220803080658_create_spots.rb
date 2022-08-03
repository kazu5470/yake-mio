class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.integer :address
      t.float :latitude
      t.float :longitude
      t.references :review, null:false, foreign_key: true
      t.timestamps
    end
  end
end
