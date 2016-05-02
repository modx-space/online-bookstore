class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,   null: false, default: ""
      t.string :email,  null: false, default: ""
      t.string :role,   null: false, default: "normal"
      t.string :status, null: false, default: "active"
      t.string :building
      t.string :office
      t.string :seat
      t.string :team

      t.timestamps null: false
    end
  end
end
