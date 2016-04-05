class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :message
      t.string :location
      t.timestamp :expiration

      t.timestamps null: false
    end
  end
end
