class ActionEmailIndex < ActiveRecord::Migration
  def change
    add_column :actions, :social_username, :string, default: "unset"
  end
end
