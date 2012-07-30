class CreateMessageTemplates < ActiveRecord::Migration
  def change
    create_table :message_templates do |t|
      t.belongs_to :company
      t.string :name
      t.string :prefix
      t.boolean :partial, default: false
      t.text :source
      t.string :formats, default: "html"
      t.string :locale, default: "en"
      t.string :handlers, default: "erb"

      t.timestamps
    end
    add_index :message_templates, :company_id
  end
end
