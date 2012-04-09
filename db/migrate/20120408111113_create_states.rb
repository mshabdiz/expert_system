class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.integer :expert_system_id

      t.timestamps
    end
  end
end
