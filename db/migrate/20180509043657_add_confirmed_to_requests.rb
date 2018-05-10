class AddConfirmedToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :confirmed, :boolean
  end
end
