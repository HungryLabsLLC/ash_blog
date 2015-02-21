class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.text :text
      t.string :name
      t.string :email
      t.integer :follower_id

      t.timestamps
    end
  end
end
