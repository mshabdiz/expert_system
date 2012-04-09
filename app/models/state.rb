class State < ActiveRecord::Base
  has_many :diagnostic_variables, as: :diagnosable, dependent: :destroy
  has_many :diagnosed_objects, dependent: :destroy
  has_one :directive, dependent: :destroy
  belongs_to :expert_system

  validates :name, :value, presence: true
  validates :expert_system_id, presence: true

  attr_accessible :name, :value, :beef
end
