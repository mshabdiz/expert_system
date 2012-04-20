class DiagnosticVariable < ActiveRecord::Base
  belongs_to :diagnosable, polymorphic: true

  validates :value, presence: true# :name,
  validates :beef, inclusion: { in: [true, false] }
  validates :value, inclusion: { in: 0..1 }
  #validates :diagnosable_id, uniqueness: { scope: [:diagnosable_id, :diagnosable_type] } #don't let update

  attr_accessible :name, :value, :beef
end
