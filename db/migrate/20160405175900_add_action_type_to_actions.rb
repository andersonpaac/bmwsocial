class AddActionTypeToActions < ActiveRecord::Migration
  def change
    add_column :actions, :action_type, :string
  end
end
