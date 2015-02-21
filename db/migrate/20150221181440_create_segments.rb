class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.integer :post_id
      t.string :kind
      t.text :content

      t.timestamps
    end
  end
end
