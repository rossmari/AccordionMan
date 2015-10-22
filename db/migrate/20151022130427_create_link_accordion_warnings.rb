class CreateLinkAccordionWarnings < ActiveRecord::Migration
  def change
    create_table :link_accordion_warnings do |t|
      t.integer :count
      t.text :message

      t.timestamps null: false
    end
  end
end
