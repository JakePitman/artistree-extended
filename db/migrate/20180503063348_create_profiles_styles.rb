class CreateProfilesStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles_styles do |t|
      t.references :profile, foreign_key: true
      t.references :style, foreign_key: true

      t.timestamps
    end
  end
end
