class AddStateIdToDiagnosticVariable < ActiveRecord::Migration
  def change
    add_column :diagnostic_variables, :state_id, :integer

  end
end
