class AddActableReferencesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :actable, polymorphic: true
  end
end
