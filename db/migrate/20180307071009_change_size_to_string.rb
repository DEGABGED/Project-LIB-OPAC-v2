class ChangeSizeToString < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :size, :string
  end
end
