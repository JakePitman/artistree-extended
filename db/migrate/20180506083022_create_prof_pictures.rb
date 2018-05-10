class CreateProfPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :prof_pictures do |t|
      t.text :image_data
      t.references :profile, foreign_key: true
      t.references :style, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
