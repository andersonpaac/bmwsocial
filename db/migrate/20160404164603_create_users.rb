class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :socialuname
      t.string :socialpwd

      t.timestamps null: false
    end
  end
end
