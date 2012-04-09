class DiagnosticVariable < ActiveRecord::Base
  belongs_to :diagnosable, polymorphic: true

  validates :name, :value, presence: true
  validates :beef, inclusion: { in: [true, false] }
  validates :value, inclusion: { in: 0..1}
  validates :state_id, presence: true

  attr_accessible :name, :value, :beef
end
