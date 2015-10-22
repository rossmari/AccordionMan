class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.integer :message_id
      t.integer :hits, null: false, default: 0

      t.timestamps null: false
    end
  end
end
