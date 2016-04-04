class AddReferenceFromDestinationsToActions < ActiveRecord::Migration
  def change
    add_reference "destinations", "action"
  end
end
