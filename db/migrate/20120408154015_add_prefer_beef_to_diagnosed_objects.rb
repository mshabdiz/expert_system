class AddPreferBeefToDiagnosedObjects < ActiveRecord::Migration
  def change
    add_column :diagnosed_objects, :prefer_beef, :boolean

  end
end
