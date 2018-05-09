class AddLastEditorToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :last_editor, :integer, index: true
    add_foreign_key :books, :users, column: :last_editor
  end
end
