class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :handle
      t.string :content
      t.timestamp :when

      t.timestamps null: false
    end
  end
end
