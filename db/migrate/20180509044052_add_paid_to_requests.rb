class AddPaidToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :paid, :boolean
  end
end
