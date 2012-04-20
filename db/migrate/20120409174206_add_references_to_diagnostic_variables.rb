class AddReferencesToDiagnosticVariables < ActiveRecord::Migration
  def change
    add_column :diagnostic_variables, :diagnosable_id, :integer
    add_column :diagnostic_variables, :diagnosable_type, :string

  end
end
