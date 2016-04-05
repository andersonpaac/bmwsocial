class ActionEmailIndexFix < ActiveRecord::Migration
  def change
    add_index :actions, :social_username
  end
end
