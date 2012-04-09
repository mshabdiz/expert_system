class AddIndexToExpertSystemsName < ActiveRecord::Migration
  def change
    add_index :expert_systems, :name, unique: true
  end
end
