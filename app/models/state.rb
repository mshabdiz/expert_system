class State < ActiveRecord::Base
  has_many :diagnostic_variables, as: :diagnosable, dependent: :destroy
  has_one :directive, dependent: :destroy, inverse_of: :state
  belongs_to :expert_system, inverse_of: :standards

  validates :name, :expert_system, presence: true#, :diagnostic_variables, :directive

  accepts_nested_attributes_for :diagnostic_variables, :directive

  attr_accessible :name, :diagnostic_variables_attributes, :directive_attributes
end
