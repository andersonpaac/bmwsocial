class AddReferenceFromActionsToUsers < ActiveRecord::Migration
  def change
    add_reference "actions", "user"
  end
end
