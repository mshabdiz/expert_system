class CreateDiagnosedObjects < ActiveRecord::Migration
  def change
    create_table :diagnosed_objects do |t|
      t.string :name
      t.string :state
      t.string :directive
      t.integer :expert_system_id

      t.timestamps
    end
  end
end
