class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :body
      t.timestamps
    end
  end
end
