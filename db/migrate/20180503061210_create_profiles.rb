class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country_code
      t.string :postcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
