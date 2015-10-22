class CreateErrors < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
