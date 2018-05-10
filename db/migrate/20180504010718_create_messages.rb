class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :request, foreign_key: true
      t.text :message_text

      t.timestamps
    end
  end
end
