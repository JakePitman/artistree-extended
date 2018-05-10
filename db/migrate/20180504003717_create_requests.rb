class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :buyer
      t.references :artist
      t.text :image_data
      t.references :style, foreign_key: true

      t.timestamps
    end
  end
end
