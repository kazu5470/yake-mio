class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user, null: false, foreign_key: true
      t.string :title
      t.string :body
      t.float :lat
      t.float :lng
      t.float :star
      t.timestamps
    end
  end
end
