class ExpertSystem < ActiveRecord::Base
  has_many :standards, :class_name => "State", dependent: :destroy, inverse_of: :expert_system
  has_many :diagnosed_objects, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :user_id, presence: true

  accepts_nested_attributes_for :standards

  attr_accessible :name, :standards_attributes
end
