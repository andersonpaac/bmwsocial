class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :handle
      t.string :content
      t.timestamp :when

      t.timestamps null: false
    end
  end
end
