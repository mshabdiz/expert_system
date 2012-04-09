class CreateExpertSystems < ActiveRecord::Migration
  def change
    create_table :expert_systems do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
