class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string "name"
      t.string "address"
      t.decimal "distance"
      t.string "estimate_time"
    end
  end
end
