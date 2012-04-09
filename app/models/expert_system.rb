class ExpertSystem < ActiveRecord::Base
  has_many :standards, :class_name => "State", dependent: :destroy
  has_many :diagnosed_objects, through: :standards
  belongs_to :user

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :user_id, presence: true

  attr_accessible :name, :standards
end
