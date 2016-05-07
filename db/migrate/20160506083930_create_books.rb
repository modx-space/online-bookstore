class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :cover
      t.string :intro
      t.string :isbn
      t.string :author
      t.string :press
      t.date :publish_date
      t.string :language
      t.string :category
      t.string :tags
      t.float :price

      t.timestamps null: false
    end
  end
end
