class AddSocialUsers < ActiveRecord::Migration
  def change
    add_index :users, :socialuname, unique: true
  end
end
