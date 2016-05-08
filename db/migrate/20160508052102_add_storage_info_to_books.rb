class AddStorageInfoToBooks < ActiveRecord::Migration
  def change
    add_column :books, :total, :integer, default: 0, null: false
    add_column :books, :available, :integer, default: 0, null: false
  end
end
