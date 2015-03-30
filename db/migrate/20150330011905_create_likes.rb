class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :ip_address
      t.integer :post_id

      t.timestamps
    end
  end
end
