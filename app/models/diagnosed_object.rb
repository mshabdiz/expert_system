class DiagnosedObject < ActiveRecord::Base
  has_many :diagnostic_variables, as: :diagnosable, dependent: :destroy
  belongs_to :state

  validates :name, presence: true
  validates :prefer_beef, inclusion: { in: [true, false] }

  attr_accessible :name
end
