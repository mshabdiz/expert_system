class CreateDiagnosticVariables < ActiveRecord::Migration
  def change
    create_table :diagnostic_variables do |t|
      t.string :name
      t.float :value
      t.boolean :beef, default: false

      t.timestamps
    end
  end
end
