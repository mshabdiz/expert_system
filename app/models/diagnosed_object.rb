class DiagnosedObject < ActiveRecord::Base
  has_many :diagnostic_variables, as: :diagnosable, dependent: :destroy
  belongs_to :expert_system

  validates :name, presence: true
  validates :prefer_beef, inclusion: { in: [true, false] }

  accepts_nested_attributes_for :diagnostic_variables

  attr_accessible :name, :state, :directive, :prefer_beef, :diagnostic_variables_attributes

  def set_state_and_directive
    min_euclidean_distance = Float::INFINITY
    min_euclidean_distance_standard = self.expert_system.standards.first
    self.expert_system.standards.each do |standard|
      sum = 0
      if self.prefer_beef?
        self.diagnostic_variables.each.with_index do |diagnostic_variable, index|
          if diagnostic_variable.beef
            sum += ( diagnostic_variable.value - standard.diagnostic_variables[index].value)**2
          end
        end
      else
        self.diagnostic_variables.each.with_index do |diagnostic_variable, index|
          unless diagnostic_variable.beef
            sum += ( diagnostic_variable.value - standard.diagnostic_variables[index].value)**2
          end
        end
      end
      if sum < min_euclidean_distance
        min_euclidean_distance = sum
        min_euclidean_distance_standard = standard
      end
    end
    self.state = min_euclidean_distance_standard.name
    self.directive = min_euclidean_distance_standard.directive.name
    self.save!
  end
end
