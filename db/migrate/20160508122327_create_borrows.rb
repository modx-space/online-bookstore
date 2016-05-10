class CreateBorrows < ActiveRecord::Migration
  def change
    create_table :borrows do |t|
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.date :should_return_date
      t.boolean :is_returned, default: false
      t.timestamp :returned_at

      t.timestamps null: false
    end
  end
end
