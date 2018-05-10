class AddAboutToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :about, :text
  end
end
