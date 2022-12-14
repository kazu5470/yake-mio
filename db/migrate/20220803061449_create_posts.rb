class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :body
      t.float :lat
      t.float :lng
      t.float :star
      t.decimal :score
      t.timestamps
    end
  end
end
